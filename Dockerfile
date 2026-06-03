FROM pytorch/pytorch:2.2.2-cuda11.8-cudnn8-runtime

# Use a non-root user if needed
WORKDIR /app

# Copy requirements and install
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy project
COPY . /app

ENV PYTHONUNBUFFERED=1

EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:$PORT", "NST_Code.app:app"]
