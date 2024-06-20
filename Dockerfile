# Stage 1: Build Stage
FROM node:14 AS build
WORKDIR /app
COPY . .
RUN npm install

# Stage 2: Production Stage
FROM node:14-slim
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["npm", "start"]
