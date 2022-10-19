. .\base.ps1 #carrega os comandos para a interface gráfica

$data = @(
[pscustomobject]@{NomeCod='Conta';TamanhoCod=9;TipoCod='Receita';PrefixCod='1'}
[pscustomobject]@{NomeCod='Conta';TamanhoCod=9;TipoCod='Despesa';PrefixCod='2'}
[pscustomobject]@{NomeCod='CentroCusto';TamanhoCod=7}
)

#comentário

$botaoOk.Add_click({ #essa parte é executada ao clicar no botão ok
    if ("" -eq $textboxDescrConta.Text -or $textboxCodConta.Text.Length -ne $listboxTipoConta.SelectedItem.TamanhoCod){
        [System.Windows.MessageBox]::Show('Preencha todos os campos com valores válidos.', 'Erro')
    }
    else{
        $cont=0
        foreach ($linha in Get-Content .\tbSgConta.txt){ #verifica se já existe algum código de conta igual
            if(($linha -split " \| ")[1] -eq $textboxCodConta.text){
                $cont++
                break
            }
        }
        if($cont -ne 0){
            [System.Windows.MessageBox]::Show('Conta já existente.')
        }
        else{ #se estiver tudo correto

            #preenche variáveis para adicionar no arquivo
            $sgconta=(Get-Content .\ixSgConta.txt)
            $cdConta=$textboxCodConta.Text
            $dsConta=$textboxDescrConta.Text
            
            if ($radiobuttonContaAtiva.Checked){ #se o status for ativo
                [string]$stConta=01
            }
            else { #se o status for inativo
                [string]$stConta=02
            }

            Add-Content -Value "$sgconta | $cdConta | $dsConta | $stConta" -Path .\tbSgConta.txt

            $ultimo=Get-Content .\ixSgConta.txt #variável recebe conteúdo do texto
            [int]$ultimo=$ultimo #variável é convertida para int
            $ultimo++ #e é incrementada
            [string]$ultimo=([string]$ultimo).PadLeft(4,'0') #variável volta a ser string padronizada com zeros à esquerda
            Clear-Content -Path .\ixSgConta.txt 
            Add-Content -Value $ultimo -Path .\ixSgConta.txt
            $labelSgConta.Text = "sgConta: " + $ultimo + ":"

            
            [System.Windows.MessageBox]::Show('Conta adicionada.')
        }
    }
})

$textboxCodConta.Add_TextChanged({ #evento acionado toda vez que a caixa de texto é modificada

    $this.Text = $this.Text -replace '\D' #substitui qualquer item não decimal por vazio
    $this.Select($this.Text.Length, 0); #coloca o cursor de volta no final do texto
    
    if($this.Text.Length -ne 0){ #se a caixa de texto não estiver vazia
            $this.Text=$this.Text.Remove(0,1).Insert(0,$listboxTipoConta.SelectedItem.PrefixCod) #troca o primeiro caracter
    }
    else{
        $this.Text = 1
    }
})



$listboxTipoConta.add_SelectedIndexChanged({ #ativado ao mudar a seleção da listbox

    #ativa os elementos de entrada
    $labelSgConta.Enabled =        $true
    $labelCodConta.Enabled =       $true
    $labelDescrConta.Enabled =     $true
    $textboxCodConta.Enabled =     $true
    $textboxDescrConta.Enabled =   $true
    $groupboxStatusConta.Enabled = $true

    $textboxCodConta.MaxLength = $listboxTipoConta.SelectedItem.TamanhoCod #define a capacidade máxima de caracteres da caixa de texto
     
    if($textboxCodConta.Text.Length -eq 0){ #imossibilitar caixa de texto vazia
        $textboxCodConta.Text = 1
    } 
    else{
        $textboxCodConta.Text=$textboxCodConta.Text.Remove(0,1).Insert(0, $listboxTipoConta.SelectedItem.PrefixCod)
    }
    

    
    $digitos = $listboxTipoConta.SelectedItem.TamanhoCod
    $labelCodConta.Text = "Digite o código da conta com $digitos dígitos :"
})



foreach ($item in $data) {
    if($item.NomeCod -eq 'Conta' ){
        [void]$listboxTipoConta.Items.Add($item)
    }
}




$listboxTipoConta.DisplayMember = "TipoCod"


$labelSgConta.Text = "sgConta: " + (Get-Content .\ixSgConta.txt) + ":" #preenche o label
[void]$formContabil.ShowDialog()
