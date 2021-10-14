##################################################################
#  *$paths recebe a lista com os paths relacionados aos Logs     #
#                                                                #
#  *$files pode ser utilizado para ignorar certas                #
#   extensões de arquivos caso necessario                        #
#                                                                #
#  * Funcao verifyFiles para troubleshoot                        #
#     * Retorna os arquivos encontrados                          #
#  * Funcao deleteFiles verifica os arquivos antes de excluir    #
#     * em caso de sucesso retorna os arquivos deletados         #
#     * em caso de falha retorna "Nenhum arquivo a ser deletado" #
##################################################################
$paths= Get-Content -Path .\lista_logs.txt
$files= Get-ChildItem $paths -exclude *.rar,*.xlsx
function verifyFiles{
	#Start-Transcript -Path "C:\Users\Admin\Desktop\Projetos\Teste\output.txt" 
	if(Test-Path -Path $files){
		$files
        return $true
	}
	else{
        exit 1
        return $false
        
    }
    #Stop-Transcript
}

function deleteFiles{
	if(Test-Path -Path $files){
        Remove-Item -Path $files
	    $files
        exit 0
    }else{
        write-host "Error code [0]:"
        exit 1
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