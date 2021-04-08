FROM python:2.7-stretch
LABEL Maintainer="celso.sanchezviera@supinfo.com"
COPY /simple_api/student_age.py /
RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y &&  pip install flask flask_httpauth flask_simpleldap python-dotenv
VOLUME /data
COPY /simple_api/student_age.json /data/student_age.json
EXPOSE 5000
CMD [ "python", "./student_age.py" ]

