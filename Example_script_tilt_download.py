import urllib.request
import shutil
import base64
import datetime

####
# Configuration Values
####
server = "demo.yieldpoint.com"  # URL
file_format = "csv3"  # API format
file_ext = ".csv"  # output file extension
location = "./"  # output file location

username = "demo"  # API username
password = "demo"  # API password

# If you are using a start time (False if you want ALL readings)
use_start_time = True
# amount of time to go back from current time if using start time
change = datetime.timedelta(hours=0, minutes=30, seconds=0)

instruments = [  # list of instruments to acquire
    "200166819",
    "200166812",
    "200166805"
]

####
# Running code
####
start_time = (datetime.datetime.now() - change).strftime("%Y-%m-%d %H:%M:%S")
# converts time string to URL acceptable
start_time = urllib.parse.quote(start_time)
time_string = ("&start_timestamp=" + start_time) if use_start_time else ""

for instrument in instruments:
    url = "http://" + server + ":8000/instruments/" + instrument + \
        "/displacement-values/?format=" + file_format + time_string  # generate URL
    request = urllib.request.Request(url)
    base64string = base64.b64encode(
        bytes('%s:%s' % (username, password), 'ascii'))  # generate BASIC auth
    request.add_header("Authorization", "Basic %s" %
                       base64string.decode('utf-8'))  # add BASIC auth
    output_file = location + instrument + file_ext  # generate output file path
    # request files
    with urllib.request.urlopen(request) as response, open(output_file, 'wb') as out_file:
        shutil.copyfileobj(response, out_file)  # save files
