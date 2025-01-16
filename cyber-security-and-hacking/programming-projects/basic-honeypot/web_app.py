import os
from pathlib import Path

import dash_bootstrap_components as dbc
import pandas as pd
import plotly.express as px
from dash import Dash, dash_table, dcc, html
from dash_bootstrap_templates import load_figure_template
from dotenv import load_dotenv
from icecream import ic

from dashboard_data_parser import *
from honeypy import *

# constants

# get base directory of where user is running honeypy from.
base_dir = base_dir = Path(__file__).parent.parent

# source creds_audits.log & cmd_audits.log file path.
creds_audits_log_local_file_path = (
    base_dir / "honeypotSetup" / "log_files" / "creds_audits.log"
)
cmd_audits_log_local_file_path = (
    base_dir / "honeypotSetup" / "log_files" / "cmd_audits.log"
)

# load dotenv() to capture environment variable.
dotenv_path = Path("public.env")
load_dotenv(dotenv_path=dotenv_path)

# pass log files to dataframe conversion
creds_audits_log_df = parse_creds_audits_log(creds_audits_log_local_file_path)
cmd_audits_log_df = parse_cmd_audits_log(cmd_audits_log_local_file_path)

# pass dataframes to top_10 calc to get top 10 values in df
top_ip_address = top_10_calculator(creds_audits_log_df, "ip_address")
top_usernames = top_10_calculator(creds_audits_log_df, "username")
top_passwords = top_10_calculator(creds_audits_log_df, "password")

# check if command column exists before calling top_10_calculator
if "Command" in creds_audits_log_df.columns:
    top_cmds = top_10_calculator(creds_audits_log_df, "Command")
else:
    top_cmds = pd.DataFrame(columns=["Command", "count"])

# pass IP address to calculate country code then to the top_10 calc
get_ip_to_country = ip_to_country_code(creds_audits_log_df)
top_country = top_10_calculator(get_ip_to_country, "Country_Code")

# python dash constants
# load cyborg theme from python dash bootstrap
load_figure_template(["cyborg"])
dbc_css = (
    "https://cdn.jsdelivr.net/gh/AnnMarieW/dash-bootstrap-templates@V1.0.4/dbc.min.css"
)

# declare dash app
app = Dash(__name__, external_stylesheets=[dbc.themes.CYBORG, dbc_css])

# provide web page title and favicon
app.title = "honey pot"
app._favicon = "/assets/honeypy-favicon.ico"
image = "/assets/pfp.jpg"

# set the value to True in (public.env) if you want country code lookup as default. this does have impact on performance by default
# if the script is erroring out with a rate limiting error (HTTP CODE 429), set country to False in (public.env), this will not look up country codes and will not show dashboard
country = os.getenv("COUNTRY")


# function to get country code lookup if country = True. This does have impact on performance | default is set to False.
def country_lookup(country):
    if country:
        get_ip_to_country = ip_to_country_code(creds_audits_log_df)
        ic(get_ip_to_country)

        top_country = top_10_calculator(get_ip_to_country, "Country_Code")
        ic(top_country)

        # DEBUG: check if Country_Code is valid in top_country dataframe and return if not
        if "Country_Code" in top_country.columns and "count" in top_country.columns:
            message = dbc.Col(
                dcc.Graph(figure=px.bar(top_country, x="Country_Code", y="count")),
                style={"width": "33%", "display": "inline-block"},
            )
        else:
            message = (
                "error: top_country data frame does not contain the required columns"
            )

    else:
        message = "No country panel defined"

    return message


# generate tables using DBC library
tables = html.Div(
    [
        dbc.Row(
            [
                dbc.Col(
                    dash_table.DataTable(
                        data=creds_audits_log_df.to_dict("records"),
                        columns=[{"name": "IP Address", "id": "ip_address"}],
                        style_table={"width": "100%", "color": "black"},
                        style_cell={"textAlign": "left", "color": "#2a9fd6"},
                        style_header={"fontWeight": "bold"},
                        page_size=10,
                    ),
                ),
                dbc.Col(
                    dash_table.DataTable(
                        data=creds_audits_log_df.to_dict("records"),
                        columns=[{"name": "Usernames", "id": "username"}],
                        style_table={"width": "100%"},
                        style_cell={"textAlign": "left", "color": "#2a9fd6"},
                        style_header={"fontWeight": "bold"},
                        page_size=10,
                    ),
                ),
                dbc.Col(
                    dash_table.DataTable(
                        data=creds_audits_log_df.to_dict("records"),
                        columns=[{"name": "Passwords", "id": "password"}],
                        style_table={"width": "100%", "justifyContent": "center"},
                        style_cell={"textAlign": "left", "color": "#2a9fd6"},
                        style_header={"fontWeight": "bold"},
                        page_size=10,
                    ),
                ),
            ]
        )
    ]
)

# dark theme for page because anything light themed is wrong
apply_table_theme = html.Div([tables], className="dbc")

# define web application layout
app.layout = dbc.Container(
    [  # honeypot title
        html.Div(
            [html.Img(src=image, style={"height": "25%", "width": "25%"})],
            style={"textAlign": "center"},
            className="dbc",
        ),
        # row 1 - 3 top 10 dashboards, ip addresses, usernames, and passwords.
        dbc.Row(
            [
                dbc.Col(
                    dcc.Graph(figure=px.bar(top_ip_address, x="ip_address", y="count")),
                    width=4,
                ),
                dbc.Col(
                    dcc.Graph(figure=px.bar(top_usernames, x="username", y="count")),
                    width=4,
                ),
                dbc.Col(
                    dcc.Graph(figure=px.bar(top_passwords, x="password", y="count")),
                ),
            ],
            align="center",
            class_name="mb-4",
        ),
        # row 2 = top 10 commands and country codes .
        dbc.Row(
            [
                dbc.Col(
                    dcc.Graph(figure=px.bar(top_cmds, x="command", y="count")),
                    style={"width": "33%", "display": "inline-block"},
                ),
                country_lookup(country),
            ],
            align="center",
            class_name="mb-4",
        ),
        # table titles
        html.Div(
            [
                html.H3(
                    "Intelligence Data",
                    style={
                        "textAlign": "center",
                        "font-family": "Consolas, sans-serif",
                        "font-weight": "bold",
                    },
                ),
            ]
        ),
        # row 3 - tables, usernames, passwords and ip addresses
        apply_table_theme,
    ]
)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
