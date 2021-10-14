############################################################
#  *paths recebe a lista com os paths relacionados ao store
#  
#  *files pode ser utilizado para ignorar certas 
#  extensões de arquivos caso necessario 
#
#  * Funcao verifyFiles para troubleshoot
#  * Funcao deleteFiles verifica os arquivos antes de excluir
############################################################
$paths= Get-Content -Path .\lista_store.txt
$files= Get-ChildItem $paths -exclude *.rar,*.xlsx
function verifyFiles{
	#Start-Transcript -Path "C:\Users\Admin\Desktop\Projetos\Teste\output.txt" 
	if(Test-Path -Path $files){
		$files
        return $true
	}
	else{ 
        return $false
    }
    #Stop-Transcript
}

function deleteFiles{
	if(verifyFiles){
        Remove-Item -Path $files
	    $files
        exit 0
    }else{
        write-host "Nenhum arquivo a ser deletado"
        exit 0
    }
}

if($files -eq $null){
    $files= "Z:\NAOEXISTE"
}
if($args[0] -eq 'verifyFiles'){
    verifyFiles
}
if($args[0] -eq 'deleteFiles'){
    deleteFiles
}