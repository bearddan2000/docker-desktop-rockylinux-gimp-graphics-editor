FROM fedora:latest

ENV APP chromium

ENV APP_EXEC chromium-browser

ENV DISPLAY :0

ENV USERNAME developer

WORKDIR /app

RUN dnf update -y

RUN dnf install -y $APP

RUN dnf builddep -y mesa

RUN adduser $USERNAME

ENV HOME /home/$USERNAME

USER $USERNAME

CMD ["/bin/chromium-browser", "--no-sandbox"]
