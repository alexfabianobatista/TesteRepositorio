unit UImpressoraFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFImpressoraFiscal = class(TForm)
    BtLeituraX: TBitBtn;
    BtLeituraZ: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnIniciarDia: TBitBtn;
    BtnAvancarLinha: TBitBtn;
    BtnFecharCupom: TBitBtn;
    BtCancelaCupom: TBitBtn;
    procedure BtLeituraXClick(Sender: TObject);
    procedure BtLeituraZClick(Sender: TObject);
    procedure BtnAvancarLinhaClick(Sender: TObject);
    procedure BtnIniciarDiaClick(Sender: TObject);
    function EmiteCF_Yanco(mCod_Nota: Variant):Boolean;
    procedure BtnFecharCupomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Analisa_iRetorno();
    Procedure Retorno_Impressora();
    procedure BtCancelaCupomClick(Sender: TObject);

  private
    { Private declarations }
  public
    procedure Y8000ECF(Comando: string);
    { Public declarations }
  end;
// Funções dos Relatórios Fiscais

function Bematech_FI_LeituraX: Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPgto , cValorPago : String ) : Integer; StdCall; External 'BEMAFI32.DLL';

var
  FImpressoraFiscal: TFImpressoraFiscal;
  Retorno:string;
  iRetorno: Integer;         // Variável com o retorno da função
  iControle: Integer;
  iACK, iST1, iST2: Integer; // Variáveis com o retorno do Status da Impressora

implementation

Uses UImpFiscal, UOracle_cl, UUsuario_cl, UNotaSaida_cl, UParamSistema_cl;

{$R *.DFM}

procedure AnaliseRet;
var ArqRet:textfile;
    Linha1:string;
begin
  if FileExists('yancoecf') then
  begin
    AssignFile(ArqRet,'yancoecf');
    Reset(ArqRet);
    Readln(ArqRet,Linha1);
    Retorno:=(linha1);
    CloseFile(ArqRet);
  end;
end;

procedure TFImpressoraFiscal.BtLeituraXClick(Sender: TObject);
var    wUsuario: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if DMUsuario.QUsuario.Active = False then
        DMUsuario.QUsuario.Open;
     if DMUsuario.QUsuarioNOME.Value = '' then
        wUsuario:= 'Supervisor'
     else
        wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);
     Y8000ECF('24|1|'+wUsuario+'|');
   End
  Else
   Begin
     iRetorno := Bematech_FI_LeituraX();
     Analisa_iRetorno();
     Retorno_Impressora();
   End;
end;

procedure TFImpressoraFiscal.BtLeituraZClick(Sender: TObject);
var wUsuario: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if MessageDlg('ATENÇÃO: Após o Fechamento não será mais permitida a '
                    +#13+'Impressão de nenhum cupom Fiscal!'
                    +#13+#13+'Fechar o Dia?',mtWarning,[mbYes,mbNo],0) = mrYes Then
     begin
       if DMUsuario.QUsuario.Active = False then
          DMUsuario.QUsuario.Open;
       if DMUsuario.QUsuarioNOME.Value = '' then
          wUsuario:= 'Supervisor'
       else
          wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);
       Y8000ECF('22|1|'+wUsuario+'|');
     end;
   End
  Else
    Begin
      If MessageDlg('A Redução Z impossibilitará novas impressões'+#13
              +'de Cupons Fiscais!'+#13+#13+'Continua ?', mtConfirmation,
               [mbYes, mbNo], 0) = mrYes then
       Begin
         iRetorno := Bematech_FI_ReducaoZ('', '');
         Analisa_iRetorno();
         Retorno_Impressora();
       End;
    End;
end;

function TFImpressoraFiscal.EmiteCF_Yanco(mCod_Nota: Variant): Boolean;
var wTotal,wVlUnitario,wVlDesconto : Real;
    wDecimal : Integer;
    wCod_Produto, wTributacao, wDesc_Produto,wCnpj,wEndereco,wNome,wTipoQtde,wAcreDesc,wImpressora,wNomeVend : String;
    wDinheiro, wEnviar, wVl_Unitario, wQt_Quantidade, wVl_Total,wDesconto,wTipoDesconto,wVendedor,wEntrada,wCondicao : String;
    wReceber1,wReceber2,wReceber3,wReceber4,wFormaPagto,wCidade,wEstado : String;
begin
  with DMNotaSaida do
  begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',mCod_Nota);
    QNotaSaida.Open;
    wImpressora:= DMOracle.BuscaNome('SELECT DESC_IMPRESSORA_FISCAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QNotaSaidaCOD_FILIAL.Value));
    //ImpFiscal.AbreCupom; *
    wTotal := 0;
    QItemNF.First;
    Y8000ECF('13|0|');   // Abre cupom fiscal - ja foi aberto ao iniciar o dia.
    //wDinheiro:=InputBox('Informe valor recebido!','Valor: ','');
    wDinheiro:= '';
    wCnpj:=''; //copy(DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)),1,30);
    If wImpressora = 'BEMATECH' Then
       iRetorno := Bematech_FI_AbreCupom(pchar(wCnpj));
    If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
     Begin
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BRASIL' Then
          wFormaPagto := 'DINHEIRO'
       Else
          wFormaPagto := 'A VISTA'
     End
    Else
      If QNotaSaidaInd_Condicao_Pagto.Value  = '3' Then
         wFormaPagto := 'CARTAO'
      Else
         wFormaPagto := 'A PRAZO';
    wVlDesconto := 0;  // para calcular o valor total de desconto que foi dado nos itens
    while not QItemNF.Eof do
    begin
      wDesc_Produto:=Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_NOTA_PRODUTO','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value)),1,25);
      if Trim(wDesc_Produto) = '' then
         wDesc_Produto:=Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)),1,25);
      if Trim(wDesc_Produto) = '' then
         wDesc_Produto:= 'PRODUTO NÃO ENCONTRADO???';
      wTributacao:= DMOracle.BuscaNome('SELECT COD_TRIB_IMP_FISCAL FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCOD_TRIBUTACAO.Value));
      if Trim(wTributacao) = 'T01' then
         wTributacao:= '01'
      else if Trim(wTributacao) = 'T02' then
              wTributacao:= '02'
      else if Trim(wTributacao) = 'T03' then
              wTributacao:= '03'
      else if Trim(wTributacao) = 'T04' then
              wTributacao:= '04'
      else if Trim(wTributacao) = 'T05' then
              wTributacao:= '05'
      else if Trim(wTributacao) = 'T06' then
              wTributacao:= '06'
      else if Trim(wTributacao) = 'S01' then
              wTributacao:= '07'
      else if Trim(wTributacao) = 'S02' then
              wTributacao:= '08'
      else if Trim(wTributacao) = 'S03' then
              wTributacao:= '09'
      else if Trim(wTributacao) = 'F' then
              If wImpressora = 'BEMATECH' Then
                 wTributacao:= 'FF'
              ELSE
                 wTributacao:= '14'
      else if Trim(wTributacao) = 'N' then
              If wImpressora = 'BEMATECH' Then
                 wTributacao:= 'NN'
              ELSE
                 wTributacao:= '16'
      else
        If wImpressora = 'BEMATECH' Then
           wTributacao:= 'II'
        ELSE
           wTributacao:= '15';   // Isento.
      wCod_Produto  := Copy(Trim(FloatToStr(QItemNFCod_Produto.Value)),1,13);
      wDesc_Produto := Copy(wDesc_Produto,1,25);
      wVlUnitario   := QItemNFVal_Unitario.Value;
      wQt_Quantidade:=FormatFloat('0.000',QItemNFQt_Quantidade.Value);
{      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
      Begin
        If (QItemNFPerc_Desc.Text <> '') And (QItemNFPerc_Desc.Text <> '0') Then
        Begin
          wVlUnitario := (wVlUnitario * 100) / (100 - QItemNFPerc_Desc.Value); // este calculo acha o valor unitario sem desconto
          wVlUnitario := strtofloat(FormatFloat('0.00',wVlUnitario));
          wVlDesconto := wVlDesconto + ((wVlUnitario - QItemNFVal_Unitario.Value)*QItemNFQt_Quantidade.Value); // para achar o valor que foi dado de desconto
          wVlDesconto := strtofloat(formatfloat('0.00',wVlDesconto));
        End;
      End;
}     wVl_Unitario  :=FormatFloat('0.00',wVlUnitario);
      wVl_Total     :=FormatFloat('0.00',(QItemNFQt_Quantidade.Value*strtofloat(wVl_Unitario)) - QItemNFVal_Desconto.Value);
      If wImpressora <> 'BEMATECH' Then  // IMPRESSORA YANCO DA ENCOPEL FOI COLOCADO <> PARA NAO DAR PROBLEMA NA ENCOPEL
       Begin
         wEnviar       := '14|' + wCod_Produto + '|' + wDesc_Produto + '|' + wVl_Unitario + '|' +
                         wQt_Quantidade + '|' + wVl_Total + '|' + wTributacao + '|0|';
         Y8000ECF(wEnviar);
       End
      Else
       Begin
         wDecimal := 2;
         wTipoQtde := 'F';  //quantidade fracionaria
         wTipoDesconto := '%';
         wDesconto := '0000';
         wQt_Quantidade:=FloatToStr(Trunc(QItemNFQt_Quantidade.Value*1000));
         wVl_Unitario  :=FloatToStr(Trunc(QItemNFVal_Unitario.Value*100));
         wVl_Total     :=FloatToStr(Trunc((QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value) - QItemNFVal_Desconto.Value)*100);

         iRetorno := Bematech_FI_VendeItem( pchar(wCod_Produto), pchar(wDesc_Produto), pchar(wTributacao),
                     pchar(wTipoQtde), pchar(wQt_Quantidade), wDecimal, pchar(wVl_Unitario),
                     pchar(wTipoDesconto), pchar(wDesconto) );
         Analisa_iRetorno();
         Retorno_Impressora();
       End;
      wTotal := wTotal + (QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value);
      wVlDesconto := wVlDesconto + QItemNFVal_Desconto.Value;
      QItemNF.Next;
    end;
    wDesconto := '0';
    If wVlDesconto > 0 Then
       wDesconto := FormatFloat('0.00',wVlDesconto);
    If wImpressora <> 'BEMATECH' Then
       Y8000ECF('1B|'+wDesconto+'|0000|0|');
    if Trim(wDinheiro) = '' then
       wDinheiro:= FormatFloat('0.00',wTotal - wVlDesconto);
{    else if StrToFloat(wDinheiro) <= wTotal then
            wDinheiro:=FormatFloat('0.00',wTotal);  }
    wEndereco:=Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)),1,42);
    wNome := Copy(DMOracle.BuscaNome('SELECT NOME FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,42);
    If Trim(wNome) = '' Then
       wNome:=Copy(DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)),1,42);
    If wImpressora <> 'BEMATECH' Then
     Begin
       wNome := Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome;
       wEnviar := ('31|'+wCnpj+'|'+wNome+'|'+wEndereco+'|'+Trim(QNotaSaidaObs.Value)+' |'+QNotaSaidaNum_Nota.Text+' |');
       If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
          Y8000ECF('15|01|'+wDinheiro+'|')   // Finalizar cupom a vista
       else If QNotaSaidaInd_Condicao_Pagto.Value = '4' Then
               Y8000ECF('15|03|'+wDinheiro+'|')   // Finalizar cupom cartao de credito
            else
               Y8000ECF('15|04|'+wDinheiro+'|');  // Finalizar cupom a prazo   era '15|07|'
       Y8000ECF(wEnviar);
       Y8000ECF('16|00|                 GRATOS|                  PELA|           P R E F E R E N C I A| |'); //Fecha cupom
       Result := True;
     End
    Else
     Begin
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BORGES' Then
       Begin
         wAcreDesc := 'D';
         wTipoDesconto := '$';
         wCNPJ := Copy(DMOracle.BuscaNome('SELECT DESC_CGC_CPF FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         wCidade := Copy(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         wEndereco := Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         wEstado := Copy(DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         wNomeVend:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QNotaSaidaCod_Vendedor.Value));
         wNomeVend:=wNomeVend + ' Nf Nr.:'+QNotaSaidaNum_Nota.Text;
         wCidade := wCidade + ' UF:'+wEstado;
         wNome := Copy(('Nome:'+Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome + '                                                '),1,48);
         wVendedor := Copy(('Vendedor:'+wNomeVend + '                                                '),1,48);
         wCNPJ := Copy(('CPF/CNPJ:'+ wCNPJ +'                                                '),1,48);
         wEndereco := Copy(('Endereco:'+wEndereco + '                                                '),1,48);
         wCidade := Copy(('Cidade:'+ wCidade + '                                                '),1,48);

         iRetorno := Bematech_FI_FechaCupom( pchar(wFormaPagto), pchar(wAcreDesc), pchar(wTipoDesconto),
                     pchar(wDesconto), pchar(wDinheiro),pchar(wNome+wCNPJ+wEndereco+wCidade+wVendedor));

         Analisa_iRetorno();
         Retorno_Impressora();

       end
       else
       Begin
         wNomeVend:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QNotaSaidaCod_Vendedor.Value));
         wNomeVend:=wNomeVend + ' Nf Nr.:'+QNotaSaidaNum_Nota.Text;
         wCondicao:=''; //DMOracle.BuscaNome('SELECT DESC_PRAZO_VENCIMENTO FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+FloatToStr(QNotaSaidaCod_Prazo_Vencimento.Value));
         wAcreDesc := 'D';
         wTipoDesconto := '$';
         wNome := Copy(('Nome:'+Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome + '                                                '),1,48);
         If QNotaSaidaDt_Emissao.Value <> QNotaSaidaDt_Recebimento.Value Then
            wCondicao := wCondicao + ' Emissao:'+QNotaSaidaDt_Emissao.Text;
         wCondicao := Copy(('Condicao:'+wCondicao + '                                                '),1,48);
         wVendedor := Copy(('Vendedor:'+wNomeVend + '                                                '),1,48);
         wEntrada := Copy(('Entrada:'+QNotaSaidaVal_Avista.Text + '                                                '),1,48);
         wReceber1 := '';
         wReceber2 := '';
         wReceber3 := '';
         wReceber4 := '';

         QContaReceber.Open;
         QContaReceber.First;
         While not QContaReceber.Eof Do
          Begin
            If QContaReceberNum_Parcela.Value = 1 Then
               wReceber1 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 2 Then
               wReceber1 := wReceber1 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 3 Then
               wReceber2 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 4 Then
               wReceber2 := wReceber2 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 5 Then
               wReceber3 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 6 Then
               wReceber3 := wReceber3 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 7 Then
               wReceber4 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 8 Then
               wReceber4 := wReceber4 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            QContaReceber.Next;
          End;
         QContaReceber.Close;
         wReceber1 := Copy((wReceber1 + '                                                '),1,48);
         wReceber2 := Copy((wReceber2 + '                                                '),1,48);
         wReceber3 := Copy((wReceber3 + '                                                '),1,48);
         wReceber4 := Copy((wReceber4 + '                                                '),1,48);
  //       iRetorno := Bematech_FI_EfetuaFormaPagamento( pchar( wFormaPagto ), pchar( wDinheiro ) );
           iRetorno := Bematech_FI_FechaCupom( pchar(wFormaPagto), pchar(wAcreDesc), pchar(wTipoDesconto),
                       pchar(wDesconto), pchar(wDinheiro),pchar(wNome+wVendedor+wEntrada+wCondicao+wReceber1+wReceber2+wReceber3+wReceber4));  //+'Obrigado, volte sempre !!!'
         Analisa_iRetorno();
         Retorno_Impressora();
       end;  
     End;
  end;
end;

procedure TFImpressoraFiscal.Y8000ECF(Comando: string);
var Arqenv:textfile;
begin
  AssignFile(arqenv,'yancoecf');
  Rewrite(arqenv);
  Writeln(arqenv,Comando);
  CloseFile(Arqenv);
  AnaliseRet;
  Edit1.Text:=retorno;
  AnaliseRet;
  Edit2.Text:=retorno;
end;

procedure TFImpressoraFiscal.BtnAvancarLinhaClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     Edit1.Text:= '';
     Edit2.Text:= '';
     Y8000ECF('21|3|');  // Avançar tres linhas.
   End;
end;

procedure TFImpressoraFiscal.BtnIniciarDiaClick(Sender: TObject);
var    wUsuario,wValor,wFormaPagamento: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if DMUsuario.QUsuario.Active = False then
        DMUsuario.QUsuario.Open;
     if DMUsuario.QUsuarioNOME.Value = '' then
        wUsuario:= 'Supervisor'
     else
        wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);

     Y8000ECF('12|1|'+wUsuario+'|');
   End
  Else
   Begin
    wValor := '0000';
    wFormaPagamento := 'DINHEIRO';
    iRetorno := Bematech_FI_AberturaDoDia(pchar(wValor), pchar(wFormaPagamento));
    Analisa_iRetorno;
    Retorno_Impressora;
   End;

end;

procedure TFImpressoraFiscal.BtnFecharCupomClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
     Y8000ECF('16|00|**************|*****FMU****|************| |');
  // FMU = Fechamento manual pelo usuario. Causa provavel problema de impressão.
end;

procedure TFImpressoraFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FImpressoraFiscal := Nil;
end;

Procedure TFImpressoraFiscal.Analisa_iRetorno();
Begin
    if iRetorno = 0 then
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -1 Then
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -2  then
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -3  then
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -4 Then
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -5 Then
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -6 Then
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -7 Then
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -8 Then
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -18 then
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -19 then
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -20 then
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -21 then
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -22 then
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -23 then
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -24 then
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -25 then
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -26 then
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -28 then
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

end;

Procedure TFImpressoraFiscal.Retorno_Impressora();
  Var iACK, iST1, iST2: Integer;
 Begin
    iACK := 0; iST1 := 0; iST2 := 0;
    iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
End;



procedure TFImpressoraFiscal.BtCancelaCupomClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
     Y8000ECF('1E')
  Else
   Begin
     iRetorno := Bematech_FI_CancelaCupom();
     Analisa_iRetorno();
     Retorno_Impressora();
   End;

end;

end.

