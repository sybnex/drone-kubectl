FROM alpine

COPY init-kubectl kubectl /opt/sinlead/kubectl/bin/

RUN mkdir -p /opt/bin && \
    apk --no-cache add curl bash gettext && \
    curl -#LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl && mv kubectl /opt/bin/ && \
    curl -#L https://git.io/get_helm.sh | bash

ENV PATH="/opt/sinlead/kubectl/bin:$PATH"

ENTRYPOINT ["kubectl"]

CMD ["--help"]
