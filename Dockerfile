FROM python:3 as mkdocsbuild
COPY . .
RUN pip install mkdocs
RUN mkdocs build

FROM stut/http-base
COPY --from=mkdocsbuild site/ ./
