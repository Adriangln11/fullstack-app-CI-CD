FROM node:16
ENV PORT=3000

WORKDIR /app
COPY . .
RUN npm install --silent
EXPOSE $PORT
CMD ["npm","start"]