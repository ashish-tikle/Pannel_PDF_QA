FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN python3 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN python3 -m pip install --user google-generativeai
RUN python3 -m pip install --user langchain-google-genai

COPY . .

CMD ["panel", "serve", "/code/QuantiphiQandA.ipynb", "--address", "0.0.0.0", "--port", "7860", "--allow-websocket-origin", "*"]

RUN mkdir /.cache
RUN chmod 777 /.cache
RUN mkdir .chroma
RUN chmod 777 .chroma
