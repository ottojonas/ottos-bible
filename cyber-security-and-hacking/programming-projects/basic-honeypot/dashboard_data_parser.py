import re

import pandas as pd
import requests
from icecream import ic


# parser for the creds file | returns ip address, username and password
def parse_creds_audits_log(creds_audits_log_file):
    data = []

    with open(creds_audits_log_file, "r") as file:
        for line in file:
            parts = line.strip().split(", ")
            ip_address = parts[0]
            username = parts[1]
            password = parts[2]
            data.append([ip_address, username, password])

    df = pd.DataFrame(data, columns=["ip_address", "username", "password"])
    return df


# parse commands entered during ssh session
def parse_cmd_audits_log(cmd_audits_log_file):
    data = []

    with open(cmd_audits_log_file, "r") as file:
        for line in file:
            lines = line.strip().split("\n")

            # regular expression to extract ip address and command
            pattern = re.compile(r"Command b'([^']*)'executed by (\d+\.\d+\.\d+\.\d+)")

            for line in lines:
                match = pattern.search(line)
                if match:
                    command, ip = match.groups()
                    data.append({"IP Address": ip, "Command": command})

    df = pd.DataFrame(data)

    return df


# generate top 10 values from a df | supply column name | countrs how ofen each value occurs | stores in count column then returns to df with value / count
def top_10_calculator(dataframe, column):
    top_10_df = pd.DataFrame()
    for col in dataframe.columns:
        if col == column:
            top_10_df = dataframe[column].value_counts().reset_index().head(10)
            top_10_df.columns = [column, "count"]
            break
    ic(top_10_df)
    return top_10_df


# takes ip as string type and uses cleantalk API to generate geolocation
def get_country_code(ip):

    data_list = []

    # api calls limited to 1000 every 60 seconds
    url = f"https://api.cleantalk.org/?method_name=ip_info&ip={ip}"

    try:
        response = requests.get(url)
        api_data = response.json()
        if response.status_code == 200:
            data = response.json()
            ip_data = data.get("data", {})
            country_info = ip_data.get(ip, {})
            data_list.append(
                {"IP Address": ip, "Country_Code": country_info.get("country_code")}
            )
        elif response.status_code == 429:
            ic(api_data["error_message"])
            ic(
                f"cleantalk ip -> geolocation rate limit exceeded, please wait 60 seconds or turn Country=False {response.status_code}"
            )
        else:
            ic(
                f"unable to retrieve data for ip {ip} status code {response.status_code}"
            )
    except requests.RequestException as e:
        ic(f"request failed: {e}")

    return data_list


# takes a df with the ip addresses | converts each ip address to country geolocation code
def ip_to_country_code(dataframe):

    data = []

    for ip in dataframe["ip_address"]:
        get_country = get_country_code(ip)
        parse_get_country = get_country[0]["Country_Code"]
        data.append({"IP Address": ip, "Country_Code:": parse_get_country})

    df = pd.DataFrame(data)
    ic(df)
    return df
