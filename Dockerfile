From ubuntu:20.04
RUN dpkg --add-architecture i386
RUN sed -i 's/archive.ubuntu.com/ubuntu.mirror.ac.za/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y wine32
COPY mt5setup.exe /app/
WORKDIR /app/
RUN wine mt5setup.exe
CMD ["wine", "/app/MetaTrader5/terminal64.exe"]
