#!/bin/bash

# Install Flask for Python 3.6
python3.6 -m pip install Flask==1.1.2

# Create the Flask app
cat > app.py << EOL
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
EOL

# Run the Flask app only if the current Python version is 3.6.x
python_version=$(python3.6 -c 'import sys; print(sys.version_info[:2])')
if [ "$python_version" == "(3, 6)" ]; then
    python3.6 app.py
else
    echo "This web app only works with Python 3.6.x."
fi

# End of script
