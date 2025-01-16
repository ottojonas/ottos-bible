import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path

from flask import Flask, redirect, render_template, request, url_for

from dashboard_data_parser import *

# logging format
logging_format = logging.Formatter("%(asctime)s %(message)s")

base_dir = base_dir = Path(__file__).parent.parent
http_audits_log_local_file_path = (
    base_dir / "honeypotSetup" / "log_files" / "http_audit.log"
)

# http logger
funnel_logger = logging.getLogger("HTTPLogger")
funnel_logger.setLevel(logging.INFO)
funnel_handler = RotatingFileHandler(
    http_audits_log_local_file_path, maxBytes=2000, backupCount=5
)
funnel_handler.setFormatter(logging_format)
funnel_logger.addHandler(funnel_handler)


def baseline_web_honeypot(input_username="admin", input_password="whakawhaka"):
    app = Flask(__name__)

    @app.route("/")
    def index():
        return render_template("wp-admin.html")

    @app.route("/wp-admin-login", methods=["POST"])
    def login():
        username = request.form["username"]
        password = request.form["password"]

        ip_address = request.remote_addr

        funnel_logger.info(
            f"Client with IP Address: {ip_address} entered\n Username: {username}, Password: {password}"
        )

        if username == input_username and password == input_password:
            return "please go to https://r.mtdv.me/gYVb1JYxGw"
        else:
            return "invalid username or password"

    return app


def run_app(port=5000, input_username="admin", input_password="whakawhaka"):
    app = baseline_web_honeypot(input_username, input_password)
    app.run(debug=True, port=port, host="0.0.0.0")

    return app
