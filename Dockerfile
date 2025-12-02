FROM node:18.14
RUN apt update
RUN \
    apt install -y git ffmpeg && \
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/bin/yt-dlp && \
    chmod +x /usr/bin/yt-dlp && \
    git clone https://github.com/develon2015/Youtube-dl-REST /Youtube-dl-REST && \
    cd /Youtube-dl-REST && \
    npm i
RUN curl https://pyenv.run | bash
RUN ~/.pyenv/bin/pyenv install 3.10.13
RUN ~/.pyenv/bin/pyenv global 3.10.13
RUN ln /root/.pyenv/shims/python /usr/bin/python
RUN rm -rf /usr/bin/python3 && ln /root/.pyenv/shims/python /usr/bin/python3
RUN python --version
RUN yt-dlp --version
WORKDIR /Youtube-dl-REST
EXPOSE 80
CMD npm run start
