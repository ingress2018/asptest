FROM microsoft/aspnetcore-build AS builder
WORKDIR /source

COPY . .
RUN dotnet restore
RUN dotnet publish --output /app/ --configuration Release

FROM microsoft/aspnetcore
WORKDIR /app
COPY --from=builder /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "AspNetCoreDemoApp.dll"]