Add-Type -AssemblyName System.Windows.forms
Add-Type -Assemblyname System.Drawing
Add-Type -AssemblyName PresentationFramework #para janelas de erro ou sucesso

#Janela principal
$formContabil = New-Object System.Windows.Forms.Form
$formContabil.text = "Conta contábil"
$formContabil.size = New-Object System.Drawing.Size(350,480)
$formContabil.StartPosition = "CenterScreen"

#Label código da conta
$labelCodConta = New-Object System.Windows.Forms.Label
$labelCodConta.Text = "Digite o código da conta:"
$labelCodConta.Location =  New-Object System.Drawing.Size(20,85)
$labelCodConta.AutoSize = $true
$labelCodConta.Enabled = $false
$formContabil.Controls.Add($labelCodConta)

#Label com o código sgConta gerado automaticamente
$labelSgConta = New-Object System.Windows.Forms.Label
$labelSgConta.Location =  New-Object System.Drawing.Size(23,122)
$labelSgConta.AutoSize = $true
$labelSgConta.Enabled = $false
$formContabil.Controls.Add($labelSgConta)

#Label Descrição conta
$labelDescrConta = New-Object System.Windows.Forms.Label
$labelDescrConta.Text = "Digite descrição da conta contábil:"
$labelDescrConta.Location =  New-Object System.Drawing.Size(20,175) #antes 95y
$labelDescrConta.AutoSize = $true
$labelDescrConta.Enabled = $false
$formContabil.Controls.Add($labelDescrConta)

#Caixa de texto código da conta
$textboxCodConta = New-Object System.Windows.Forms.TextBox
#$textboxCodConta.Minimum = 10000000
#$textboxCodConta.Maximum = 29999999
#$textboxCodConta.Value   = 10000001
#$textboxCodConta.Text = 1
$textboxCodConta.Location = New-Object System.Drawing.Size(103,120)
$textboxCodConta.Size = New-Object System.Drawing.Size(205,20)
$textboxCodConta.Enabled = $false
$formContabil.Controls.Add($textboxCodConta)

#Caixa de texto descrição de conta contábil
$textboxDescrConta = New-Object System.Windows.Forms.TextBox
$textboxDescrConta.Location = New-Object System.Drawing.Size(22,210) #antes 130y
$textboxDescrConta.Size = New-Object System.Drawing.Size(286,20)
$textboxDescrConta.Enabled = $false
$formContabil.Controls.Add($textboxDescrConta)

#botão cancelar 
$botaoCancelar = New-Object System.Windows.Forms.Button 
$botaoCancelar.Location = New-Object System.Drawing.Size(130,390)
$botaoCancelar.Size = New-Object System.Drawing.Size(100,20)
$botaoCancelar.Text = "Fechar"
$botaoCancelar.Add_Click({$formContabil.Tag = $formContabil.close()}) 
$formContabil.Controls.Add($botaoCancelar)

#botão ok
$botaoOk = New-Object System.Windows.Forms.Button #botão ok
$botaoOk.Location = New-Object System.Drawing.Size(20,390)
$botaoOk.Size = New-Object System.Drawing.Size(100,20)
$botaoOk.Text = "Ok"
$formContabil.Controls.Add($botaoOk)



#Groupbox para botões radiais status da conta
$groupboxStatusConta = New-Object System.Windows.Forms.GroupBox 
$groupboxStatusConta.Location = New-Object System.Drawing.Size(20,245)
$groupboxStatusConta.Size = New-Object System.Drawing.Size(286, 50)
$groupboxStatusConta.Text = "Status da conta"
$groupboxStatusConta.Enabled = $false
$formContabil.Controls.Add($groupboxStatusConta)

$radiobuttonContaAtiva = New-Object System.Windows.Forms.RadioButton
$radiobuttonContaAtiva.Location = '11,20'
$radiobuttonContaAtiva.size = '99,20'
$radiobuttonContaAtiva.Checked = $true 
$radiobuttonContaAtiva.Text = "Ativo"

$radiobuttonContaInativa = New-Object System.Windows.Forms.RadioButton
$radiobuttonContaInativa.Location = '110,20'
$radiobuttonContaInativa.size = '80,20'
$radiobuttonContaInativa.Checked = $false
$radiobuttonContaInativa.Text = "Inativo"
$groupboxStatusConta.Controls.AddRange(@($radiobuttonContaAtiva,$radiobuttonContaInativa))

#Label Tipo Conta
$labelTipoConta = New-Object System.Windows.Forms.Label
$labelTipoConta.Text = "Digite o Tipo da conta:"
$labelTipoConta.Location =  New-Object System.Drawing.Size(20,15)
$labelTipoConta.AutoSize = $true
$formContabil.Controls.Add($labelTipoConta)

#combobox Tipo de Conta
$listboxTipoConta = New-Object System.Windows.Forms.ComboBox
$listboxTipoConta.Location = New-Object System.Drawing.Size(20,42)
$listboxTipoConta.Size = New-Object System.Drawing.Size(260,20)
$listboxTipoConta.Height = 80
$listboxTipoConta.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$formContabil.Controls.Add($listboxTipoConta)
