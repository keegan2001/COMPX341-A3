#Checks if a commit message is attached initially. 
if ($args[0] -eq $null){
    write-host -ForegroundColor Red "Please enter a commit message"
    write-host -ForegroundColor Green "Correct Usage: .\pipeline.ps1 ""Commit message"" "
    exit 1
}
write-host ForegroundColor Orange " Installing the npm"
npm install 
write-host ForegroundColor Orange " Building project"
npm run build 
if($?){

    write-host -ForegroundColor Green "Build Succeeded"
    write-host ForegroundColor Orange " Pushing to git"
    cd ..
    git add .
    git commit -m $args[0]
    git push origin main
    write-host -ForegroundColor Green "Changes pushed to git successfully!"

    cd .\assets
    write-host "(3) Starting project locally..."
    npm run start
}
else{
    write-host -ForegroundColor Red "Build Failed"
    write-host "Unable to commit due to compile-time errors "
}