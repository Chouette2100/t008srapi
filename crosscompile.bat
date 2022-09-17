echo off
@if "%3"=="" (
  echo "usage: %0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]"
  exit /b

)

set cond=FALSE
if %1==linux set cond=TRUE
if %1==freebsd set cond=TRUE
if %1==darwin set cond=TRUE
if %1==android set cond=TRUE
if %1==windows set cond=TRUE

if %cond%==TRUE (
 set GOOS=%1
) ELSE (
  echo "usage: %0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]"
  exit /b
)


set cond=FALSE
if %2==amd64 set cond=TRUE
if %2==arm64 set cond=TRUE

if %cond%==TRUE (
 set GOARCH=%2
) ELSE (
  echo "usage: %0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]"
  exit /b
) 

if "%1"=="windows" (
 set extname=exe
) else (
 set extname=%1
)

set filename=%~n3
echo go build -o %filename%.%2.%extname% %filename%.go
go build -o %filename%.%2.%extname% %filename%.go
set GOOS=windows
set GOARCH=amd64

