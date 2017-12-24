# gasstation-express
A Lightweight Ethereum Gas Price Oracle for Anyone Running a Full Node

This is a simple gas price oracle that can be used if you are running a local geth or parity node.  It will look at gasprices over the last 200 blocks and provide gas price estimates based on the minimum gas price accepted in a percentage of blocks. 


usage: python3 gasExpress.py

requirements: pip3 install -r requirements.txt
