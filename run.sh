ps -ef |grep blog_mini | awk '{print $2}' | xargs sudo kill -9

python_home=/root/workspace/venv/blog_mini
out_put_log=/root/workspace/log/service_logs/blog_mini.log

nohup $python_home/bin/gunicorn -n blog_mini -w 10 --timeout 240 -b  :80 -k gevent manage:app --limit-request-line 0 --limit-request-field_size 0 --worker-connections 100 --max-requests 1000 --reload > $out_put_log 2>&1 &
