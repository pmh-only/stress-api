FROM public.ecr.aws/docker/library/alpine

RUN apk add --no-cache curl

ARG user=1000
ARG group=1000

USER $user:$group
WORKDIR /app

COPY --chown=$user:$group stress-arm64 .
RUN chmod a+rx stress-arm64

ENTRYPOINT ["/app/stress-arm64"]
