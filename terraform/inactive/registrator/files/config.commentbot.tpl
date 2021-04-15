[commentbot]
http_port = 8081
http_ip = "0.0.0.0"
log_level = "debug"
backend_port = 5555
trigger = "@RollenRegistratorBot"
stop_file = "/tmp/stopcommentbot"
issue_repo = "JuliaRegistries/Registrator.jl"
report_issue = false
reply_comment = true
set_status = true
enc_key = "1234567890123456"
disable_pull_request_trigger = false
disable_approval_process = false
disable_private_registrations = false
check_private_membership = true
registry_deps = [ "https://github.com/JuliaRegistries/General", "https://github.com/AiaiaCapital/AiaiaRegistry",]

[commentbot.github]
user = "RollenRegistratorBot"
email = "rollenseb+RegistratorBot@gmail.com"
token = "<<registrator/commentbot_token>>"
secret = "<<registrator/webhook_secret>>"
app_id = 49507
priv_pem = "private-key.pem"

[commentbot.slack]
alert = false
token = "xxxx"
channel = "xxxx"

[commentbot.targets.AiaiaRegistry]
repo = "https://github.com/AiaiaCapital/AiaiaRegistry"
base_branch = "master"
