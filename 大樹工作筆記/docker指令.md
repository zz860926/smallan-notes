#### privileged参数
```yml
privileged: true
```
https://blog.csdn.net/halcyonbaby/article/details/43499409

#### restart
```yml
restart: unless-stopped
```
```yml
no – 容器退出时不要自动重启。这个是默认值。
on-failure[:max-retries] – 只在容器以非0状态码退出时重启。可选的，可以退出docker daemon尝试重启容器的次数。
always – 不管退出状态码是什么始终重启容器。当指定always时，docker daemon将无限次数地重启容器。容器也会在daemon启动时尝试重启，不管容器当时的状态如何。
unless-stopped – 不管退出状态码是什么始终重启容器，不过当daemon启动时，如果容器之前已经为停止状态，不要尝试启动它。
```

## How I Set Up Laravel in Docker Container
https://medium.com/@sreejithezhakkad/how-i-set-up-laravel-in-docker-container-f80987559bc6