import os, smtplib

# set email and password for sending email
email = 'sender@address.com'
password = 'password'

sent_from = email
sent_to = 'recipient@address.com'
subject = 'Raspberry Pi - TAR Begin'
body = 'The TAR process has begun.'

email_text = """\
From: %s
To: %s
Subject: %s

%s
""" % (sent_from, sent_to, subject, body)

try:
	server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
	server.ehlo()
	server.login(email, password)
	server.sendmail(sent_from, sent_to, email_text)
	server.close()

	print ('Email sent!')
except:
	print ('Something went wrong...')
