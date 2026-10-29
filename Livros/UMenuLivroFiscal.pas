unit UMenuLivroFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Mask, Buttons, variants, maskUtils,
  UArquivoDIMEWordSC, ImgList, ComCtrls;

type
  TFMenuLivroFiscal = class(TFTMenuPrincipal)
    Livros1: TMenuItem;
    RegistrodeSadas1: TMenuItem;
    RegistrodeEntradas1: TMenuItem;
    LivroFiscal1: TMenuItem;
    Gia1: TMenuItem;
    desc: TMenuItem;
    N1: TMenuItem;
    RegistrodeINSS1: TMenuItem;
    RegistrodeServiosPrestados1: TMenuItem;
    ArquivodeRegistrodeEntradas1: TMenuItem;
    RegistrodeNotas1: TMenuItem;
    GerarArquivoMagnticoGisSt1: TMenuItem;
    GrupoFiscal1: TMenuItem;
    ArquivodeRegistrodeEntradasProdutosPrimrios21: TMenuItem;
    N2: TMenuItem;
    GerarArquivoSiscredi1: TMenuItem;
    GerarArquivoMagnticoReceitaFederal1: TMenuItem;
    GerarArquivoMagnticoReceitaFederalSaida1: TMenuItem;
    RegistrodeEntradasIPI1: TMenuItem;
    RegistrodeSaidasIPI1: TMenuItem;
    ArquivoMagneticoSC1: TMenuItem;
    LivroFiscalIPI1: TMenuItem;
    ArquivoMagnticoInss1: TMenuItem;
    EmissoTermosAberturaEncerramento1: TMenuItem;
    N3: TMenuItem;
    ArquivoMagnticoTipo60MestreAnaltico1: TMenuItem;
    ArquivoMagnticoTipo60Resumo1: TMenuItem;
    N4: TMenuItem;
    ParmetrosdePISCOFINS1: TMenuItem;
    ArquivoMagnticoIntegraoSapiens1: TMenuItem;
    ArquivoMagnticoTipo60Dirio1: TMenuItem;
    LivroFiscalSaidaICMS1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RegistrodeEntradas1Click(Sender: TObject);
    procedure RegistrodeSadas1Click(Sender: TObject);
    procedure LivroFiscal1Click(Sender: TObject);
    procedure Gia1Click(Sender: TObject);
    procedure descClick(Sender: TObject);
    procedure RegistrodeINSS1Click(Sender: TObject);
    procedure RegistrodeServiosPrestados1Click(Sender: TObject);
    procedure ArquivodeRegistrodeEntradas1Click(Sender: TObject);
    procedure RegistrodeNotas1Click(Sender: TObject);
    procedure GerarArquivoMagnticoGisSt1Click(Sender: TObject);
    procedure GrupoFiscal1Click(Sender: TObject);
    procedure ArquivodeRegistrodeEntradasProdutosPrimrios21Click(
      Sender: TObject);
    procedure GerarArquivoSiscredi1Click(Sender: TObject);
    procedure GerarArquivoMagnticoReceitaFederal1Click(Sender: TObject);
    procedure GerarArquivoMagnticoReceitaFederalSaida1Click(
      Sender: TObject);
    procedure RegistrodeEntradasIPI1Click(Sender: TObject);
    procedure RegistrodeSaidasIPI1Click(Sender: TObject);
    procedure ArquivoMagneticoSC1Click(Sender: TObject);
    procedure esticulo1Click(Sender: TObject);
    procedure LivroFiscalIPI1Click(Sender: TObject);
    procedure ArquivoMagnticoInss1Click(Sender: TObject);
    procedure EmissoTermosAberturaEncerramento1Click(Sender: TObject);
    procedure ArquivoMagnticoTipo60Resumo1Click(Sender: TObject);
    procedure ArquivoMagnticoTipo60MestreAnaltico1Click(Sender: TObject);
    procedure ParmetrosdePISCOFINS1Click(Sender: TObject);
    procedure ArquivoMagnticoIntegraoSapiens1Click(Sender: TObject);
    procedure ArquivoMagnticoTipo60Dirio1Click(Sender: TObject);
    procedure LivroFiscalSaidaICMS1Click(Sender: TObject);
  private
    procedure Proc_Registros_Contabeis;
    procedure Proc_Notas_Fiscais_Emitidas;
    procedure Proc_Itens_Notas_Fiscais_Emitidas;
    procedure Proc_Itens_Notas_Fiscais_Terceiros;
    procedure Proc_Notas_Fiscais_Terceiros;
    procedure Proc_Cadastro;
    procedure Proc_Plano_Conta;
    procedure Proc_Natureza_Operacao;
    procedure Proc_Mercadorias;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuLivroFiscal: TFMenuLivroFiscal;
  s, wEspacos : String;

implementation

uses URegEntradaParam, URegSaidaParam, UTela_cl, ULivroFiscalCad, UGiaCad,
     ULivroFiscal_Cl, ULivroFiscalParam, UOracle_cl, URegINSS, URegINSS_cl,
  UFilial_cl, URRegINSS, URRegSaida, UBiblioteca, URegServPrestadosParam,
  UUsuario_cl, URegEntrada_cl, URegNota, UParamSistema_cl, UGrupoFiscalCad,
  USiscrediParam, USiscredi_Cl, URegSaida_cl , URRegEntradaIPI,
  URRegEntradaIPIAnalitico, URRegSaidaIPIAnalitico,
  URegEntradaIPIParam, URegSaidaIPIParam, URRegSaidaIPI, UApuracaoParam,
  URegistro60, ULivroFiscalIPICad, UEmissaoTermo, URegistro60ResumoCad,
  URegistro60MestreCad, UParamPisCofins, UCadastro_cl,
  URegistroTipo60DCad, URRegSaidaIcms;

{$R *.DFM}
{ Função remove mascara cgc/cpf e acrescenta zeros }
Function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
Var x : integer;
    wS : String;
begin
  wS := '';
  for x := 1 to length(wCgc1) do
      if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
         wS := wS + wCgc1[x];

  while Length(wS) < Zeros do
        wS := '0' + wS;

  Result := wS;

end;

procedure TFMenuLivroFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  pMODULO := 'LIVRO FISCAL';
end;

procedure TFMenuLivroFiscal.RegistrodeEntradas1Click(Sender: TObject);
begin
  inherited;
  If FRegEntradaParam = Nil Then
    FRegEntradaParam := TFRegEntradaParam.Create(Application);
  FRegEntradaParam.PGRelatorio.Pages[0].TabVisible := True;
  FRegEntradaParam.ShowModal;
end;

procedure TFMenuLivroFiscal.RegistrodeSadas1Click(Sender: TObject);
begin
  inherited;
  If FRegSaidaParam = Nil Then
    FRegSaidaParam := TFRegSaidaParam.Create(Application);
  FRegSaidaParam.PGRelatorio.Pages[0].TabVisible := True;
  FRegSaidaParam.ShowModal;
end;

procedure TFMenuLivroFiscal.LivroFiscal1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalCad = Nil Then
    FLivroFiscalCad := TFLivroFiscalCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLivroFiscalCad.Caption,FLivroFiscalCad.Name);
  FLivroFiscalCad.ShowModal;
end;

procedure TFMenuLivroFiscal.Gia1Click(Sender: TObject);
begin
  inherited;
  if FGiaCad = Nil Then
    FGiaCad := TFGiaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FGiaCad.Caption,FGiaCad.Name);
  FGiaCad.ShowModal;
end;

procedure TFMenuLivroFiscal.descClick(Sender: TObject);
var
  F : TextFile;
  S, S51, S53, S54, S60, S61, S70, S74, S75, wDesc_Inscricao, wNum_Inscricao, wPAliquota, T90 : String;
  wCgc, wInscricao, wFilial, wCidade, wEstado, wTelefone : String;
  wIPAMagnet, wEndereco, wComplement, wBairro            : String;
  wCep, wContato, wNEndereco, wCGC_50, wUF,wAno,wMes, wAliquota, wCnpj_ant    : String;
  wNumNota,x,wTotalGeral, wNRegistro50,wNRegistro51,wNRegistro53,wNRegistro54,wNRegistro60,wNRegistro61,wNRegistro70,wNRegistro74,wNRegistro75,wNRegistro60R : Integer;
  wPCIPI, wIPI : Real;
  wDataDocumento: String;
begin
  inherited;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[2].TabVisible := True;
  If DMOracle.BuscaNome('SELECT IND_IPI FROM TB_FILIAL','COD_FILIAL = '+DMParamSistema.QParamSistemaCod_Filial.Text) = 'S' Then
     FLivroFiscalParam.Rg3GerarIpi.ItemIndex := 0
  Else
     FLivroFiscalParam.Rg3GerarIpi.ItemIndex := 1;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME3Filial.Text),'LIVRO FISCAL');
    QRLivroFiscalArquivo.Close;
    QRLivroFiscalArquivo_R51.Close;
    QRLivroFiscalArquivo_R53.Close;
    QRLivroFiscalArquivo61.Close;
    QRLivroFiscalArquivo61R.Close;
    QRLivroFiscalArquivo_R70.Close;
    QRLivroFiscalArquivo_R75.Close;
    QRLivroFiscalArquivoItens.Close;

    Case FLivroFiscalParam.Rg3TipoNota.ItemIndex Of
      0 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivo_R51.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivo_R53.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA','E');
       End;
      1 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivo_R51.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivo_R53.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA','S');
       End;
      2 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivo_R51.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivo_R53.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA',Null);
       End;
    End;
    If Trim(FLivroFiscalParam.Me3Estado.Text) <> '' Then
     Begin
       QRLivroFiscalArquivo.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivo_R51.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivo_R53.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivo61.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivo61R.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivoItens.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
       QRLivroFiscalArquivo_R75.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me3Estado.Text));
     End
    Else
     Begin
       QRLivroFiscalArquivo.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivo_R51.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivo_R53.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivo61.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivo61R.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivoItens.SetVariable('COD_ESTADO',Null);
       QRLivroFiscalArquivo_R75.SetVariable('COD_ESTADO',Null);
     End;
    QRLivroFiscalArquivo.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R51.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R51.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R53.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R53.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo61.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo61.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo61R.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo61R.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R70.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R70.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R75.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R75.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivoItens.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivoItens.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    wAno := FormatDateTime('YYYY',StrToDate(FLivroFiscalParam.ME3DataI.Text));
    wMes := FormatDateTime('MM',StrToDate(FLivroFiscalParam.ME3DataI.Text));
    QRLivroFiscalArquivo_R75.SetVariable('NUM_MES', copy(FLivroFiscalParam.ME3MesAno.Text,0,2));
    QRLivroFiscalArquivo_R75.SetVariable('NUM_ANO', copy(FLivroFiscalParam.ME3MesAno.Text,3,4));
    QRLivroFiscalArquivo.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R51.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R53.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo61.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo61R.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R70.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R75.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivoItens.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    If FLivroFiscalParam.Rg3Inventario.ItemIndex = 0 Then // Gerar registro de inventario
       QRLivroFiscalArquivo_R75.SetVariable('GERAR_INVENTARIO','SIM')
    Else
       QRLivroFiscalArquivo_R75.SetVariable('GERAR_INVENTARIO','NAO');
    QRLivroFiscalArquivo.Open;
    QRLivroFiscalArquivo.First;

    wCgc       := DMOracle.BuscaNome('SELECT NUM_CGC           FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wInscricao := DMOracle.BuscaNome('SELECT DESC_INSCRICAO    FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wFilial    := DMOracle.BuscaNome('SELECT DESC_FILIAL       FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wCidade    := DMOracle.BuscaNome('SELECT DESC_CIDADE       FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wEstado    := DMOracle.BuscaNome('SELECT COD_ESTADO        FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wTelefone  := DMOracle.BuscaNome('SELECT DESC_TELEFONE     FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wIPAMagnet := DMOracle.BuscaNome('SELECT IND_PADRAO_ARQ_MAGNETICO FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wEndereco  := DMOracle.BuscaNome('SELECT DESC_ENDERECO     FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wNEndereco := DMOracle.BuscaNome('SELECT NUM_ENDERECO      FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wComplement:= DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_ENDERECO FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wBairro    := DMOracle.BuscaNome('SELECT DESC_BAIRRO       FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wCep       := DMOracle.BuscaNome('SELECT DESC_CEP          FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));
    wContato   := DMOracle.BuscaNome('SELECT DESC_NOME_CONTATO FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME3Filial.Text));

    // Pega tamanho do Inscricao
    // -------------------------------------------------- \\
    wDesc_Inscricao := Copy(wInscricao,1,1);

    if ( wDesc_Inscricao = 'I' ) Or ( wInscricao = '' ) then
       wDesc_Inscricao := 'ISENTO       '
    else
    begin
      x:=1 ;
      WDesc_Inscricao := '';  // Inicializa valor da variavel
      while x <= Length(wInscricao) do
      begin
        if ( Copy(wInscricao, x, 1) >= '0' ) and
           ( Copy(wInscricao, x, 1) <= '9' ) then
           wDesc_Inscricao := wDesc_Inscricao + Copy(wInscricao,x,1) ;
           Inc(x,1);
      end;
    end;
    S := '10'                                                         +  { Tipo }
    RMaskCGC_CPF(wCgc,14)                                             +
    FormatMaskText('CCCCCCCCCCCCCC',wDesc_Inscricao)                  +
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wFilial)     +
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wCidade)          +
    FormatMaskText('CC',wEstado)                                      +
    RMaskCGC_CPF(wTelefone,10)                                        +
    Copy(FLivroFiscalParam.ME3DataI.Text,7,4)                         +
    Copy(FLivroFiscalParam.ME3DataI.Text,4,2)                         +
    Copy(FLivroFiscalParam.ME3DataI.Text,1,2)                         +
    Copy(FLivroFiscalParam.ME3DataF.Text,7,4)                         +
    Copy(FLivroFiscalParam.ME3DataF.Text,4,2)                         +
    Copy(FLivroFiscalParam.ME3DataF.Text,1,2)                         +
    Copy(FLivroFiscalParam.Rg3TipoArquivo.Items[FLivroFiscalParam.Rg3Convenio.ItemIndex],1,1) +  // tipo do convenio
    Copy(wIPAMagnet,2,1)                                              +
    Copy(FLivroFiscalParam.Rg3TipoArquivo.Items[FLivroFiscalParam.Rg3TipoArquivo.ItemIndex],1,1) +
    Chr(13)+Chr(10);
    // ---------------  Tipo 11 abaixo --------------\\
    S := S + '11'                                                     +  { Tipo }
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wEndereco)    +
    bib.StrZeroDecimal(StrToInt('0'+wNEndereco),5,0)                             +
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCC',wComplement)              +
    FormatMaskText('CCCCCCCCCCCCCCC',wBairro)                         +
    RMaskCGC_CPF(wCep,8)                                              +
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCC',wContato)           +
    RMaskCGC_CPF(wTelefone,12)                                        +
    Chr(13) + Chr(10) ;

    // ---------------  Tipo 50 abaixo --------------\\

    wNRegistro50 := 0 ;   // Inicializa variavel.
    wNRegistro54 := 0;
    wNRegistro75 := 0;
    wNRegistro70 := 0;
    If FLivroFiscalParam.Rg3CupomFiscal.ItemIndex = 1 Then // quando for igual a 0 é somente arquivo de cupom fiscal
    Begin
      While not QRLivroFiscalArquivo.Eof do
      begin
        if QRLivroFiscalArquivoPERC_ALIQUOTA.Value = 0 then
           wPAliquota := '0000'
        else
           wPaliquota := bib.StrZeroDecimal(QRLivroFiscalArquivoPERC_ALIQUOTA.Value,2,0) + '00';

        If (QRLivroFiscalArquivoNUM_INSCRICAO.Value <> 'ISENTO       ') then
        begin
          x:=0 ;
          wNum_Inscricao := '';
          while x <= Length(QRLivroFiscalArquivoNUM_INSCRICAO.Value) do
          begin
            Inc(x,1);
            if ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) >= '0' ) and
               ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) <= '9' ) then
               wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,x,1) ;
          end;
        End;

        //Para garantir que inscrição saia corretamente se for ISENTO
        if(Trim(QRLivroFiscalArquivoNUM_INSCRICAO.Value) = 'ISENTO') then
          wNum_Inscricao := 'ISENTO       '
        else
          wNum_Inscricao := bib.FormataTexto(wNum_Inscricao, 14);


        If Length(QRLivroFiscalArquivoNUM_CGC_CPF.Value) < 14 Then  // se for menor que 14 se refere a pessoa fisica
          Begin
           If Trim(QRLivroFiscalArquivoNUM_CGC_CPF.Value) = '' Then
              wCGC_50 := '00000000000000'
           Else
              wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14)
          End
        else
           wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14);
        If Trim(QRLivroFiscalArquivoUF_CLIENTE.Value) = 'PY' Then
           wUf := 'EX'
        Else
           wUf := QRLivroFiscalArquivoUF_CLIENTE.Value;
        wNRegistro50 := wNRegistro50 + 1 ;
        //Pega data do documento considerando se for entrada ou saída
        if Trim(QRLivroFiscalArquivoIND_ENTRADA_SAIDA.Value) = 'E' then
        begin
          wDataDocumento :=
          Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,7,4)        +  {Ano}
          Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,4,2)        +  {Mes}
          Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,1,2);          {Dia}
        end
        else
        begin
          wDataDocumento :=
          Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,7,4)        +  {Ano}
          Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,4,2)        +  {Mes}
          Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,1,2);          {Dia}
        end;
        //-------------------------------------------------------------
        If Trim(QRLivroFiscalArquivoIND_SITUACAO.Value) <> '3' then  // não é uma nota cancelada.
        begin
          S:= S + '50'                                             + { Tipo }
          wCGC_50                                                  +
          FormatMaskText('CCCCCCCCCCCCCC',Trim(wNum_Inscricao))    +
          wDataDocumento                                           +
          wUF                                                      +
          FormatMaskText('CC',Trim(QRLivroFiscalArquivoDesc_Modelo.Value));  { Modelo da nota}
          If QRLivroFiscalArquivoCOD_SERIE.Value = 'M1' Then
             s := s + '1  '
          Else
             s := s + FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value); { Serie na nota }
  //        FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value);
  //        '  '                                                                   + { Sub-serie da NFiscal }
          if Length(QRLivroFiscalArquivoNUM_NOTA.Text) > 6 then
            S := S + Copy(QRLivroFiscalArquivoNUM_NOTA.Text,Length(QRLivroFiscalArquivoNUM_NOTA.Text)-5,6)                        //+
          else
            S := S + bib.StrZeroDecimal(QRLivroFiscalArquivoNUM_NOTA.Value,6,0);          //+
          S := S +
          bib.StrZeroDecimal(QRLivroFiscalArquivoNAT_OPERACAO.value,4,0)      + { Classificação Fiscal de Operação }
          QRLivroFiscalArquivoIND_EMITE.value                      + { P-Propria T-Terceiros }
          bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_TOTAL.Value+QRLivroFiscalArquivoVAL_SUBST_TRIBUT.Value,13,2)        +
          bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_ICM_BASE.Value,13,2)     +
          bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_ICM.Value,13,2)          +
          bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_BASE_ISENTA.Value,13,2)  +
          bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_BASE_OUTRAS.value+QRLivroFiscalArquivoVAL_SUBST_TRIBUT.Value,13,2)  +
          wPAliquota                                               +
          Trim(QRLivroFiscalArquivoSITUACAO.Value);
          If FLivroFiscalParam.Rg3Objetivo.ItemIndex = 1 Then  // para enviar o arquivo para escritorio contabil
           Begin
             S := S + FormatDateTime('YYYYMMDD',QRLivroFiscalArquivoDT_EMISSAO.Value);
             If QRLivroFiscalArquivoInd_Condicao_Pagto.Value = '2' Then
                S := S + 'P'
             Else
                S := S + 'C';
             If QRLivroFiscalArquivoInd_Fisica_Juridica.Value = 'J' Then
                S := S + 'CNPJ'
             Else
                S := S + 'CPF ';
             wIPI := StrToFloat('0'+DMOracle.BuscaNome('SELECT Sum(Val_Ipi) FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+QRLivroFiscalArquivoCod_Nota_Cab.Text));
             wPCIPI := StrToFloat('0'+DMOracle.BuscaNome('SELECT Distinct Perc_Ipi FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+QRLivroFiscalArquivoCod_Nota_Cab.Text));
             If wIPI <> 0 Then
              Begin
                S := S + bib.StrZeroDecimal(QRLivroFiscalArquivoVAL_TOTAL.Value,13,2);
                S := S + bib.StrZeroDecimal(wPCIPI,4,2);
                S := S + bib.StrZeroDecimal(wIPI,13,2);
              End
             Else
                S := S + '000000000000000000000000000000';
           End;
          S := S + Chr(13)+Chr(10);
        end
        else    // É uma nota fiscal cancelada. Tratamento especial.
        begin
          S:= S + '50'                                             + { Tipo }
          wCGC_50                                                  +
          FormatMaskText('CCCCCCCCCCCCCC',wNum_Inscricao)          +
          wDataDocumento                                           +
          wUF                                                      +
          FormatMaskText('CC',Trim(QRLivroFiscalArquivoDesc_Modelo.Value));  { Modelo da nota}
  //        '1  ';                                                    //+  { SERIE da nota???}
          If QRLivroFiscalArquivoCOD_SERIE.Value = 'M1' Then
             s := s + '1  '
          Else
             s := s + FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value); { Serie na nota }
  //        '  '                                                                   + { Sub-serie da NFiscal }
          if Length(QRLivroFiscalArquivoNUM_NOTA.Text) > 6 then
            S := S + Copy(QRLivroFiscalArquivoNUM_NOTA.Text,Length(QRLivroFiscalArquivoNUM_NOTA.Text)-5,6)
          else
            S := S + bib.StrZeroDecimal(QRLivroFiscalArquivoNUM_NOTA.Value,6,0);          //+

          S := S +
          bib.StrZeroDecimal(QRLivroFiscalArquivoNAT_OPERACAO.value,4,0)      + { Classificação Fiscal de Operação }
          QRLivroFiscalArquivoIND_EMITE.value                      + { P-Propria T-Terceiros }
          '0000000000000'                                          + { Valor total da nota }
          '0000000000000'                                          + { Base de calculo do ICMS }
          '0000000000000'                                          + { Valor do ICMS }
          '0000000000000'                                          + { Isenta ou não tributada }
          '0000000000000'                                          + { Outras }
          '0000'                                                   + { Aliquota ICMS }
          'S';                                                       {Situação e fim do registro.}
          If FLivroFiscalParam.Rg3Objetivo.ItemIndex = 1 Then  // para enviar o arquivo para escritorio contabil
           Begin
             S := S + FormatDateTime('YYYYMMDD',QRLivroFiscalArquivoDT_EMISSAO.Value);
             If QRLivroFiscalArquivoInd_Condicao_Pagto.Value = '2' Then
                S := S + 'P'
             Else
                S := S + 'C';
             If QRLivroFiscalArquivoInd_Fisica_Juridica.Value = 'J' Then
                S := S + 'CNPJ'
             Else
                S := S + 'CPF ';
             S := S + '000000000000000000000000000000';
           End;
          S := S + Chr(13)+Chr(10);
        end;
        QRLivroFiscalArquivo.Next;  // Pula para proximo registro.
      end;
      // aqui comeca registro tipo 51
      If FLivroFiscalParam.Rg3GerarIpi.ItemIndex = 0 Then
      Begin
        QRLivroFiscalArquivo_R51.Open;
        wNumNota := 0;
        x := 0; 
        while not QRLivroFiscalArquivo_R51.Eof do
        begin
          Inc(wNRegistro51);

          if QRLivroFiscalArquivo_R51IND_ENTRADA_SAIDA.Value = 'E' then
          begin
            wDataDocumento :=
            Copy(QRLivroFiscalArquivo_R51DT_RECEBIMENTO.Text,7,4)                    +  {Ano}
            Copy(QRLivroFiscalArquivo_R51DT_RECEBIMENTO.Text,4,2)                    +  {Mes}
            Copy(QRLivroFiscalArquivo_R51DT_RECEBIMENTO.Text,1,2);                      {Dia}
          end
          else
          begin
            wDataDocumento :=
            Copy(QRLivroFiscalArquivo_R51DT_EMISSAO.Text,7,4)                    +  {Ano}
            Copy(QRLivroFiscalArquivo_R51DT_EMISSAO.Text,4,2)                    +  {Mes}
            Copy(QRLivroFiscalArquivo_R51DT_EMISSAO.Text,1,2);                      {Dia}
          end;

          wNum_Inscricao := Copy(QRLivroFiscalArquivo_R51NUM_INSCRICAO.Value,1,1);
          If (wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) Then
              wNum_Inscricao := 'ISENTO       '
          else
          Begin
            x:=0 ;
            wNum_Inscricao := '';
            while x <= Length(QRLivroFiscalArquivo_R51NUM_INSCRICAO.Value) do
            begin
              Inc(x,1);
              if ( Copy(QRLivroFiscalArquivo_R51NUM_INSCRICAO.Value, x, 1) >= '0' ) and
                 ( Copy(QRLivroFiscalArquivo_R51NUM_INSCRICAO.Value, x, 1) <= '9' ) then
                 wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivo_R51NUM_INSCRICAO.Value,x,1) ;
            End;
          End;

          If Length(QRLivroFiscalArquivo_R51NUM_CGC_CPF.Value) < 14 Then
           Begin
             If Trim(QRLivroFiscalArquivo_R51NUM_CGC_CPF.Value) = '' Then
                wCGC_50 := '00000000000000'
             Else
                wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R51NUM_CGC_CPF.Value,14)
           End
          else
             wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R51NUM_CGC_CPF.Value,14);
          s51 := s51 + '51'                                                        +
          wCGC_50 + FormatMaskText('CCCCCCCCCCCCCC',wNum_Inscricao)                +
          wDataDocumento                                                           +
          QRLivroFiscalArquivo_R51UF_CLIENTE.Value;
          If QRLivroFiscalArquivo_R51COD_SERIE.Value = 'M1' Then
             s51 := s51 + '1  '
          Else
             s51 := s51 + FormatMaskText('CCC',QRLivroFiscalArquivo_R51COD_SERIE.Value); { Serie na nota }

          if Length(QRLivroFiscalArquivo_R51NUM_NOTA.Text) > 6 then
            s51 := s51 + Copy(QRLivroFiscalArquivo_R51NUM_NOTA.Text,Length(QRLivroFiscalArquivo_R51NUM_NOTA.Text)-5,6)
          else
            s51 := s51 + bib.StrZeroDecimal(QRLivroFiscalArquivo_R51NUM_NOTA.Value,6,0);          //+

          s51 := s51 +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R51NAT_OPERACAO.value,4,0)       + { Classificação Fiscal de Operação }
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R51VAL_TOTAL.Value,13,2)         +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R51VAL_IPI.Value,13,2)           +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R51VAL_ISENTA_IPI.Value,13,2)    +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R51VAL_OUTRAS_IPI.Value,13,2)    +
          Bib.AjustaStr('', 20)                                                    +
          QRLivroFiscalArquivo_R51IND_SITUACAO.Value + Chr(13)+Chr(10);
          QRLivroFiscalArquivo_R51.Next;
        end;
      End;
      // aqui comeca registro tipo 53
      If FLivroFiscalParam.Rg3Substituto.ItemIndex = 0 Then
      Begin
        QRLivroFiscalArquivo_R53.Open;
        wNumNota := 0;
        x := 0;
        while not QRLivroFiscalArquivo_R53.Eof do
        begin
          Inc(wNRegistro53);
          wNum_Inscricao := Copy(QRLivroFiscalArquivo_R53NUM_INSCRICAO.Value,1,1);
          If (wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) Then
              wNum_Inscricao := 'ISENTO       '
          else
          Begin
            x:=0 ;
            wNum_Inscricao := '';
            while x <= Length(QRLivroFiscalArquivo_R53NUM_INSCRICAO.Value) do
            begin
              Inc(x,1);
              if ( Copy(QRLivroFiscalArquivo_R53NUM_INSCRICAO.Value, x, 1) >= '0' ) and
                 ( Copy(QRLivroFiscalArquivo_R53NUM_INSCRICAO.Value, x, 1) <= '9' ) then
                 wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivo_R53NUM_INSCRICAO.Value,x,1) ;
            End;
          End;
          //Pegar data de Emissao e Recebimento - Junior 07/11/2013. Estava pegando somente DT_Recebimento. - TEMPERMED
          if Trim(QRLivroFiscalArquivo_R53IND_ENTRADA_SAIDA.Value) = 'E' then
          begin
            wDataDocumento := 
            Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,7,4)        +  {Ano}
            Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,4,2)        +  {Mes}
            Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,1,2);          {Dia}
          end
          else
          begin
            wDataDocumento :=
            Copy(QRLivroFiscalArquivo_R53DT_EMISSAO.Text,7,4)        +  {Ano}
            Copy(QRLivroFiscalArquivo_R53DT_EMISSAO.Text,4,2)        +  {Mes}
            Copy(QRLivroFiscalArquivo_R53DT_EMISSAO.Text,1,2);          {Dia}
          end;

          If Length(QRLivroFiscalArquivo_R53NUM_CGC_CPF.Value) < 14 Then
           Begin
             If Trim(QRLivroFiscalArquivo_R53NUM_CGC_CPF.Value) = '' Then
                wCGC_50 := '00000000000000'
             Else
                wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R53NUM_CGC_CPF.Value,14)
           End
          else
             wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R53NUM_CGC_CPF.Value,14);
          s53 := s53 + '53'                                                        +
          wCGC_50 + FormatMaskText('CCCCCCCCCCCCCC',wNum_Inscricao)                +
          //ALTERADO POR ESTAR PEGANDO SOMENTE DT_RECEBIMENTO. ESTAVA DANDO DIVERGENCIA NA TEMPERMED.
          //Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,7,4)        +  {Ano}
          //Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,4,2)        +  {Mes}
          //Copy(QRLivroFiscalArquivo_R53DT_RECEBIMENTO.Text,1,2);          {Dia}
          wDataDocumento                                                           +
          QRLivroFiscalArquivo_R53UF_CLIENTE.Value                                 +
          FormatMaskText('CC',Trim(QRLivroFiscalArquivo_R53Desc_Modelo.Value));  { Modelo da nota}
          If QRLivroFiscalArquivo_R53COD_SERIE.Value = 'M1' Then
             s53 := s53 + '1  '
          Else
             s53 := s53 + FormatMaskText('CCC',QRLivroFiscalArquivo_R53COD_SERIE.Value); { Serie na nota }

          if Length(QRLivroFiscalArquivo_R53NUM_NOTA.Text) > 6 then
            s53 := s53 + Copy(QRLivroFiscalArquivo_R53NUM_NOTA.Text,Length(QRLivroFiscalArquivo_R53NUM_NOTA.Text)-5,6)
          else
            s53 := s53 + bib.StrZeroDecimal(QRLivroFiscalArquivo_R53NUM_NOTA.Value,6,0);          //+

          s53 := s53 +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R53NAT_OPERACAO.value,4,0)            + { Classificação Fiscal de Operação }
          QRLivroFiscalArquivo_R53IND_EMITE.value                                       +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R53VAL_BASE_SUBST.Value,13,2)         +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R53VAL_ICMS_SUBST.Value,13,2)         +
          bib.StrZeroDecimal(QRLivroFiscalArquivo_R53VAL_DESPESAS.Value,13,2)           +
          QRLivroFiscalArquivo_R53IND_SITUACAO.Value                                    +
          '                              ' + Chr(13)+Chr(10);
          QRLivroFiscalArquivo_R53.Next;
        end;
        QRLivroFiscalArquivo_R53.Close;
      End;
      // aqui comeca registro tipo 54
      QRLivroFiscalArquivoItens.Open;
      wNumNota := 0;
      x := 0;
      while not QRLivroFiscalArquivoItens.Eof do
      begin
        if QRLivroFiscalArquivoItensQT_QUANTIDADE.Value = 0 then
        begin
          QRLivroFiscalArquivoItens.Next;
          continue;
        end;
        If (wNumNota  <> QRLivroFiscalArquivoItensNUM_NOTA.Value)    Or
           (wCnpj_ant <> QRLivroFiscalArquivoItensNUM_CGC_CPF.Value) Then
           x := 0;  // serve para controlar o numero do item na nota fiscal
        wNumNota := Trunc(QRLivroFiscalArquivoItensNUM_NOTA.Value);
        wCnpj_ant := QRLivroFiscalArquivoItensNUM_CGC_CPF.Value;
        Inc(x);
        Inc(wNRegistro54);
  //      if QRLivroFiscalArquivoItensIND_FISICA_JURIDICA.Value = 'F' then
        If Length(QRLivroFiscalArquivoItensNUM_CGC_CPF.Value) < 14 Then
         Begin
           If Trim(QRLivroFiscalArquivoItensNUM_CGC_CPF.Value) = '' Then
              wCGC_50 := '00000000000000'
           Else
              wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoItensNUM_CGC_CPF.Value,14)
         End
        else
           wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoItensNUM_CGC_CPF.Value,14);
        if QRLivroFiscalArquivoItensPERC_ALIQUOTA.Value = 0 then
           wPAliquota := '0000'
        else
           wPaliquota := bib.StrZeroDecimal(QRLivroFiscalArquivoItensPERC_ALIQUOTA.Value,2,0) + '00';
        s54 := s54 + '54'                                                        +
        wCGC_50                                                                  +
        FormatMaskText('CC',Trim(QRLivroFiscalArquivoItensDESC_MODELO.Value));     {modelo da nota}
        If QRLivroFiscalArquivoItensCOD_SERIE.Value = 'M1' Then
           s54 := s54 + '1  '
        Else
           s54 := s54 + FormatMaskText('CCC',QRLivroFiscalArquivoItensCOD_SERIE.Value);
  //      '  '                                                                   + { Sub-serie da NFiscal }

        if Length(QRLivroFiscalArquivoItensNUM_NOTA.Text) > 6 then
          s54 := s54 + Copy(QRLivroFiscalArquivoItensNUM_NOTA.Text,Length(QRLivroFiscalArquivoItensNUM_NOTA.Text)-5,6) 
        else
          s54 := s54 + bib.StrZeroDecimal(QRLivroFiscalArquivoItensNUM_NOTA.Value,6,0);          //+

        s54 := s54 +
        bib.StrZeroDecimal(QRLivroFiscalArquivoItensNAT_OPERACAO.value,4,0)                 + { Classificação Fiscal de Operação }
        '000';                                                                     { codigo da situação tributaria}
        If QRLivroFiscalArquivoItensQT_QUANTIDADE.Value > 0 Then
           s54 := s54 + bib.StrZeroDecimal(x,3,0) +
           FormatMaskText('CCCCCCCCCCCCCC',FloatToStr(QRLivroFiscalArquivoItensCOD_PRODUTO.Value))
        Else
           s54 := s54 + '998' + FormatMaskText('CCCCCCCCCCCCCC',' ');
        s54 := s54 + bib.StrZeroDecimal(QRLivroFiscalArquivoItensQT_QUANTIDADE.Value,11,3)  +
        bib.StrZeroDecimal(QRLivroFiscalArquivoItensVAL_TOTAL.Value,12,2)                   +
        bib.StrZeroDecimal(QRLivroFiscalArquivoItensVAL_DESCONTO.Value,12,2)                +
        bib.StrZeroDecimal(QRLivroFiscalArquivoItensVAL_ICM_Base.Value,12,2)                +
        '000000000000000000000000'                                               +
        wPAliquota+Chr(13)+Chr(10);
        QRLivroFiscalArquivoItens.Next;
      end;
    End;
    // ---------------  Tipo 60 abaixo --------------\\
    QRTipo60Mestre.Close;
    QRTipo60Mestre.SetVariable('dt_emissao_ini', FLivroFiscalParam.ME3DataI.Text);
    QRTipo60Mestre.SetVariable('dt_emissao_fin', FLivroFiscalParam.Me3DataF.Text);
    QRTipo60Mestre.open;
    QRTipo60Mestre.First;

    wNRegistro60 := 0;
    S60 := '';
    QRTipo60Analitico.Close;
    QRTipo60Analitico.Open;

    while not QRTipo60Mestre.Eof do
    Begin
      Inc(wNRegistro60);

      S60 := S60                                                                 +
      '60'                                                                       +
      'M'                                                                        +
      FormatDateTime('YYYYMMDD', QRTipo60MestreDT_EMISSAO.Value)                 +
      bib.AjustaStr(QRTipo60MestreDESC_SERIE.Value, 20)                          +
      FormatFloat('000', QRTipo60MestreNUM_SEQUENCIAL.Value)                     +
      Bib.AjustaStr(QRTipo60MestreDESC_MODELO.Value, 2)                          +
      FormatFloat('000000', QRTipo60MestreNUM_COO_INI.Value)                     +
      FormatFloat('000000', QRTipo60MestreNUM_COO_FIN.Value)                     +
      FormatFloat('000000', QRTipo60MestreNUM_CONTADOR_REDUCAOZ.Value)           +
      FormatFloat('000', QRTipo60MestreNUM_REINICIO_OPRERACAO.Value)             +
      FormatFloat('0000000000000000', QRTipo60MestreVAL_VENDA_BRUTA.Value * 100) +
      FormatFloat('0000000000000000', QRTipo60MestreVAL_TOTAL_GERAL.Value * 100) +
      Bib.AjustaStr('', 37)                                                      +
      Chr(13) + Chr(10);

      while not QRTipo60Analitico.Eof do
      Begin
        Inc(wNRegistro60);

        S60 := S60                                                                   +
        '60'                                                                         +
        'A'                                                                          +
        FormatDateTime('YYYYMMDD', QRTipo60AnaliticoDT_EMISSAO.Value)                +
        Bib.AjustaStr(QRTipo60MestreDESC_SERIE.Value, 20)                         +
        Bib.AjustaStr(QRTipo60AnaliticoIND_SITUACAO_TRIBUTARIA.Value, 4)             +
        FormatFloat('000000000000', QRTipo60AnaliticoVLR_ACUMULADO_TOTAL_PARCIAL.Value * 100) +
        Bib.AjustaStr('', 79)                                                        +
        Chr(13) + Chr(10);

        QRTipo60Analitico.Next;
      End;

      // ---------------  Tipo 60D abaixo --------------\\
      QRTipo60Diario.Close;
      QRTipo60Diario.SetVariable('DT_REGISTRO_MESTRE',QRTipo60MestreDT_EMISSAO.Value);      
      QRTipo60Diario.Open;

      while not QRTipo60Diario.Eof do
      begin
        Inc(wNRegistro60);
        S60 := S60                                                                  +
        '60D'                                                                       +
        copy(QRTipo60DiarioDT_EMISSAO.Text,7,4)                                     +
          copy(QRTipo60DiarioDT_EMISSAO.Text,4,2)                                   +
          copy(QRTipo60DiarioDT_EMISSAO.Text,1,2)                                   +
        QRTipo60DiarioNUM_SERIE.Text                                                +
        FormatMaskText('CCCCCCCCCCCCCC',QRTipo60DiarioDESC_COD_BARRA.Text)          +
        StringReplace(formatFloat('0000000000.000',QRTipo60DiarioQT_QUANTIDADE.Value),',','',[rfIgnoreCase,rfReplaceAll])     +
        StringReplace(formatFloat('00000000000000.00',QRTipo60DiarioVAL_TOTAL.Value),',','',[rfIgnoreCase,rfReplaceAll])      +
        StringReplace(formatFloat('00000000000000.00',QRTipo60DiarioVAL_BASE_ICMS.Value),',','',[rfIgnoreCase,rfReplaceAll])  +
        bib.FormataTexto(QRTipo60DiarioDESC_ST.Text,4,' ')                          +
        StringReplace(formatFloat('00000000000.00',QRTipo60DiarioVAL_ICMS.Value),',','',[rfIgnoreCase,rfReplaceAll])          +
        '                   ' + Chr(13) + Chr(10); //19 posições em branco no final
        QRTipo60Diario.Next;
      end;

      QRTipo60Mestre.Next;
    End;
    QRTipo60Mestre.Close;
    QRTipo60Analitico.Close;
    QRTipo60Diario.Close;


    // ---------------  Tipo 60R abaixo --------------\\

    QRTipo60Resumo.Close;
    QRTipo60Resumo.SetVariable('MES',wMes);
    QRTipo60Resumo.SetVariable('ANO',wAno);
    QRTipo60Resumo.Open;
    wNRegistro60R := 0;

    while not QRTipo60Resumo.Eof do
    Begin
      Inc(wNRegistro60R);
      wAliquota := QRTipo60ResumoPERC_ALIQUOTA.Text;
      if Length(wAliquota) = 2 then
        wAliquota := QRTipo60ResumoPERC_ALIQUOTA.Text + '00'
      else
      if Length(wAliquota) = 1 then
        wAliquota := QRTipo60ResumoPERC_ALIQUOTA.Text + '000'
      else
      if Length(wAliquota) = 3 then
        wAliquota := QRTipo60ResumoPERC_ALIQUOTA.Text + '0';
      if StrToFloat(wAliquota) = 0 then
        wAliquota := QRTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value + '   ';
      S60 := S60                                                                 +
      '60'                                                                       +
      'R'                                                                        +
      wMes + wAno                                                                +
      Bib.AjustaStr(QRTipo60ResumoCOD_PRODUTO.Text,14)                           +
      Bib.StrZeroDecimal(QRTipo60ResumoQT_QUANTIDADE.Value,13,3)                 +
      bib.StrZeroDecimal(QRTipo60ResumoVAL_PRODUTO.Value,16,2)                   +
      bib.StrZeroDecimal(QRTipo60ResumoVAL_BASE_ICMS.Value,16,2)                 +
      wAliquota                                                                  +
      Bib.AjustaStr('', 54)                                                      +
      Chr(13) + Chr(10);

      QRTipo60Resumo.Next;
    End;  


// ---------------  Tipo 61 abaixo --------------\\
    QRLivroFiscalArquivo61.open;
    QRLivroFiscalArquivo61.First;

    wNRegistro61 := 0;
    S61 := '';

    while not QRLivroFiscalArquivo61.Eof do
    Begin
      Inc(wNRegistro61);

      S61 := S61                                                                 +
      '61                            '                                           +
      FormatDateTime('YYYYMMDD',QRLivroFiscalArquivo61DT_EMISSAO.Value)          +
      '02'                                                                       +
      bib.AjustaStr('D', 3)+'  '                                                 +
      FormatFloat('000000', QRLivroFiscalArquivo61NUM_NOTA.Value)                +
      FormatFloat('000000', QRLivroFiscalArquivo61NUM_NOTA.Value)                +
      FormatFloat('0000000000000', QRLivroFiscalArquivo61VAL_TOTAL.Value * 100)  +
      FormatFloat('0000000000000', QRLivroFiscalArquivo61VAL_ICM_BASE.Value * 100)      +
      FormatFloat('000000000000', QRLivroFiscalArquivo61VAL_ICM.Value * 100)     +
      FormatFloat('0000000000000', QRLivroFiscalArquivo61VAL_BASE_ISENTA.Value * 100)   +
      FormatFloat('0000000000000', QRLivroFiscalArquivo61VAL_BASE_OUTRAS.Value * 100)   +
      FormatFloat('0000', QRLivroFiscalArquivo61PERC_ALIQUOTA.Value * 100)       +
      Bib.AjustaStr('', 1)                                                       +
      Chr(13) + Chr(10);
      QRLivroFiscalArquivo61.Next;
    End;
    QRLivroFiscalArquivo61.Close;
// ---------------  Encerrou tipo 61 acima --------------\\

// ---------------  iniciou tipo 61R Abaixo --------------\\

{    QRLivroFiscalArquivo61R.open;
    QRLivroFiscalArquivo61R.First;

    wNRegistro61 := 0;
    while not QRLivroFiscalArquivo61R.Eof do
    Begin
      Inc(wNRegistro61);

      S61 := S61                                                                 +
      '61R'                                                                      +
      QRLivroFiscalArquivo61RMESANO.Value                                         +
      bib.AjustaStr(QRLivroFiscalArquivo61RCOD_PRODUTO.Text, 14)                 +
      FormatFloat('0000000000000', QRLivroFiscalArquivo61RQT_QUANTIDADE.Value * 1000)    +
      FormatFloat('0000000000000000', QRLivroFiscalArquivo61RVAL_TOTAL.Value * 100)      +
      FormatFloat('0000000000000000', QRLivroFiscalArquivo61RVAL_ICM_BASE.Value * 100)   +
      FormatFloat('0000', QRLivroFiscalArquivo61RPERC_ALIQUOTA.Value * 100)      +
      Bib.AjustaStr('', 54)                                                      +
      Chr(13) + Chr(10);
      QRLivroFiscalArquivo61R.Next;
    End;
    QRLivroFiscalArquivo61R.Close;
}
// -------------tipo finaliza 61R ---------------------//

// ---------------  Tipo 74 abaixo --------------\\
    If FLivroFiscalParam.Rg3Inventario.ItemIndex = 0 Then // Gerar registro de inventario
    Begin
      QRLivroFiscalArquivo_R74.Close;
      QRLivroFiscalArquivo_R74.SetVariable('COD_FILIAL', trim(FLivroFiscalParam.Me3Filial.Text));
      QRLivroFiscalArquivo_R74.SetVariable('NUM_MES', copy(FLivroFiscalParam.ME3MesAno.Text,0,2));
      QRLivroFiscalArquivo_R74.SetVariable('NUM_ANO', copy(FLivroFiscalParam.ME3MesAno.Text,3,4));
      QRLivroFiscalArquivo_R74.open;
      wNRegistro74 := 0;
      S74 := '';

      while not QRLivroFiscalArquivo_R74.Eof do
      Begin
        Inc(wNRegistro74);
        S74 := S74 + '74'                                                                +
        FormatDateTime('YYYYMMDD', StrToDate(QRLivroFiscalArquivo_R74DT_INVENTARIO.Text))+
        Bib.AjustaStr(QRLivroFiscalArquivo_R74Cod_Produto.Text, 14)                      +
        FormatFloat('0000000000000',QRLivroFiscalArquivo_R74Qt_Quantidade.Value * 1000)  +
        FormatFloat('0000000000000',QRLivroFiscalArquivo_R74Qt_Quantidade.Value * QRLivroFiscalArquivo_R74Vl_Custo_Medio.Value * 100) +
        '1'                                                                        +
        '00000000000000'                                                           +
        Bib.AjustaStr('', 14)                                                      +
        FormatMaskText('CC',wEstado)                                               +
        Bib.AjustaStr('', 45)                                                      +
        Chr(13) + Chr(10);
        QRLivroFiscalArquivo_R74.Next;
      End;
      QRLivroFiscalArquivo_R74.Close;
    End;
    // ---------------  Tipo 75 abaixo --------------\\

    QRLivroFiscalArquivo_R75.Open;
    QRLivroFiscalArquivo_R75.First;

    while not QRLivroFiscalArquivo_R75.Eof do
    begin
    //retirado pelo César porque na nova versao do valida nao aceita mandar 2 vezes o mesmo produto
{      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Then
         If (FLivroFiscalParam.Me3Estado.Text = 'RJ') And
            (QRLivroFiscalArquivo_R75Ind_Vendas.Value = 'N') Then
          Begin
            QRLivroFiscalArquivo_R75.Next;
            Continue;
          End;  }
      Inc(wNRegistro75);
      S75 := S75 + '75'                                                 +
      Copy(FLivroFiscalParam.ME3DataI.Text,7,4)                         +
      Copy(FLivroFiscalParam.ME3DataI.Text,4,2)                         +
      Copy(FLivroFiscalParam.ME3DataI.Text,1,2)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,7,4)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,4,2)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,1,2)                         +
      FormatMaskText('CCCCCCCCCCCCCC',FloatToStr(QRLivroFiscalArquivo_R75COD_PRODUTO.Value))+
      FormatMaskText('CCCCCCCC',QRLivroFiscalArquivo_R75NUM_GENERO_NCM.Value) +
      FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QRLivroFiscalArquivo_R75Desc_Produto.Value) +
      FormatMaskText('CCCCCC',QRLivroFiscalArquivo_R75DESC_UNIDADE.Value)+
      '000000000000000000000000000'+Chr(13)+Chr(10);
      QRLivroFiscalArquivo_R75.Next;  // Pula para proximo registro.
    end;

    QRLivroFiscalArquivo_R70.Open;
    QRLivroFiscalArquivo_R70.First;
    // ---------------  Tipo 70 abaixo --------------\\
    while not QRLivroFiscalArquivo_R70.Eof do
    begin
      wNRegistro70 := wNRegistro70 + 1 ;
      wNum_Inscricao := Copy(QRLivroFiscalArquivo_R70NUM_INSCRICAO.Value,1,1);
      If ( wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) Or
         (QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA.Value = 'F') Then
          wNum_Inscricao := UpperCase('ISENTO       ')
      else
      begin  
        x:=0 ;
        wNum_Inscricao := '';
        while x <= Length(QRLivroFiscalArquivo_R70NUM_INSCRICAO.Value) do
        begin
          Inc(x,1);
          If ( Copy(QRLivroFiscalArquivo_R70NUM_INSCRICAO.Value, x, 1) >= '0' ) and
             ( Copy(QRLivroFiscalArquivo_R70NUM_INSCRICAO.Value, x, 1) <= '9' ) then
             wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivo_R70NUM_INSCRICAO.Value,x,1) ;
        end;
      end;
      // Verifica se cadastro é pessoa fisica
//      If QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA.Value = 'F' then
      If Length(QRLivroFiscalArquivo_R70NUM_CGC_CPF.Value) < 14 Then
       Begin
         If Trim(QRLivroFiscalArquivo_R70NUM_CGC_CPF.Value) = '' Then
            wCGC_50 := '00000000000000'
         Else
            wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R70NUM_CGC_CPF.Value,14)
       End
      else
         wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivo_R70NUM_CGC_CPF.Value,14);
      If Trim(DMLivroFiscal.QRLivroFiscalArquivo_R70UF_CLIENTE.Value) = 'PY' Then
         wUf := 'EX'
      Else
         wUf := DMLivroFiscal.QRLivroFiscalArquivo_R70UF_CLIENTE.Value;
      S70:= S70 + '70'                                                       + { Tipo }
      wCGC_50                                                                +
      FormatMaskText('CCCCCCCCCCCCCC',Trim(wNum_Inscricao))                  +
      Copy(DMLivroFiscal.QRLivroFiscalArquivo_R70DT_EMISSAO.Text,7,4)        +  {Ano}
      Copy(DMLivroFiscal.QRLivroFiscalArquivo_R70DT_EMISSAO.Text,4,2)        +  {Mes}
      Copy(DMLivroFiscal.QRLivroFiscalArquivo_R70DT_EMISSAO.Text,1,2)        +  {Dia}
      wUF                                                                    +
      FormatMaskText('CC',Trim(DMLivroFiscal.QRLivroFiscalArquivo_R70DESC_MODELO.Value))    + {modelo da nota}
      FormatMaskText('CCC',COPY(DMLivroFiscal.QRLivroFiscalArquivo_R70COD_SERIE.Value,1,1));
//      '07U'                                                                  +  { Modelo da nota???}
//      FormatMaskText('C',DMLivroFiscal.QRLivroFiscalArquivoCOD_SERIE.Value)  +
//      '  '                                                                   + { Sub-serie da NFiscal }
      with DMLivroFiscal do
      begin
        // Caso Num.Conhecimento tiver mais que 6 Digitos, lançar no arquivo somente
        // os ultimos 6. Djeison A. S. - 25/10/2013
        if (Length(QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.AsString) > 6) then
          S70 := S70 + Copy(QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.AsString,
                        Length(QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.AsString) - 5,
                        Length(QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.AsString))
        else
          S70 := S70 + bib.StrZeroDecimal(QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.Value,6,0);
        S70 := S70 +
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70NAT_OPERACAO.value,4,0)  + { Classificação Fiscal de Operação }
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70VAL_TOTAL.Value,13,2)    +
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70VAL_ICM_BASE.Value,14,2)     +
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70VAL_ICM.Value,14,2)          +
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70VAL_BASE_ISENTO.Value,14,2)  +
        bib.StrZeroDecimal(QRLivroFiscalArquivo_R70VAL_BASE_OUTRAS.value,14,2)  +
        '1'                                                                    +
        Trim(QRLivroFiscalArquivo_R70SITUACAO.Value)+Chr(13)+Chr(10);
      end;
      QRLivroFiscalArquivo_R70.Next;
    end;

    // ---------------  Tipo 90 abaixo --------------\\

    // 2 = Tipo10 + Tipo11 -  wNRegistro50 = Soma tipo 50  -  1 = Tipo90
    S := S + S51 + S53 + S54 + S60 + S61 + S70 + S74 + S75;
    wTotalGeral := 2 + wNRegistro50 + wNRegistro51 + wNRegistro53 + wNRegistro54 + wNRegistro60 + wNRegistro60R+ wNRegistro61 + wNRegistro70 + wNRegistro74 + wNRegistro75 + 1 ;

    T90 := '90'                                          +
    RMaskCGC_CPF(wCgc,14)                                +
    FormatMaskText('CCCCCCCCCCCCCC',wDesc_Inscricao)     +
    '50'                                                 +  // Tipo de registro a ser totalizado.
    RMaskCGC_CPF(IntToStr(wNRegistro50),8);
    if wNRegistro51 > 0 Then
     Begin
       T90 := T90 + '51'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro51),8);
     End;
    If wNRegistro53 > 0 Then
     Begin
       T90 := T90 + '53'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro53),8);
     End;
    if wNRegistro54 > 0 Then
     Begin
       T90 := T90 + '54'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro54),8);
     End;
    if wNRegistro60+wNRegistro60R > 0 Then
     Begin
       T90 := T90 + '60'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro60+wNRegistro60R),8);
     End;
    If wNRegistro61 > 0 Then
     Begin
       T90 := T90 + '61'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro61),8);
     End;
    If wNRegistro70 > 0 Then
     Begin
       T90 := T90 + '70'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro70),8);
     End;
    If wNRegistro74 > 0 Then
     Begin
       T90 := T90 + '74'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro74),8);
     End;
    If wNRegistro75 > 0 Then
     Begin
       T90 := T90 + '75'                                 +  // Tipo de registro a ser totalizado.
       RMaskCGC_CPF(IntToStr(wNRegistro75),8);
     End;
    T90 := T90 + '99'+RMaskCGC_CPF(IntToStr(wTotalGeral),8);

    // Este procedimento é necessario para o tamanho da string S ficar igual a 126.
    while Length(T90) <= 124 do
          T90 := T90 + ' ';

    S := S + T90 + '1'; // + Chr(13)+Chr(10) ;
    //------------------ Fim --------------------------\\

    If FLivroFiscalParam.Rg3Objetivo.ItemIndex = 1 Then  // para enviar o arquivo para escritorio contabil
     Begin
       QRLivroFiscalArquivo.First;
       While not QRLivroFiscalArquivo.Eof do
       begin
         S := S + '7E';
         DMCadastro.QCadastro.Close;
         DMCadastro.QCadastro.SetVariable('PK',QRLivroFiscalArquivoCod_Cadastro.Value);
         DMCadastro.QCadastro.Open;
         S := S + bib.StrZeroDecimal(QRLivroFiscalArquivoCod_Cadastro.Value,8,0);
         wNum_Inscricao := Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,1,1);
         If (wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) Or
            (QRLivroFiscalArquivoIND_FISICA_JURIDICA.Value = 'F') Then
             wNum_Inscricao := 'ISENTO       '
         else
         begin
           x:=0 ;
           wNum_Inscricao := '';
           while x <= Length(QRLivroFiscalArquivoNUM_INSCRICAO.Value) do
           begin
             Inc(x,1);
             if ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) >= '0' ) and
                ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) <= '9' ) then
                wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,x,1) ;
           end;
         End;
         If Length(QRLivroFiscalArquivoNUM_CGC_CPF.Value) < 14 Then  // se for menor que 14 se refere a pessoa fisica
           Begin
            If Trim(QRLivroFiscalArquivoNUM_CGC_CPF.Value) = '' Then
               wCGC_50 := '00000000000000'
            Else
               wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14)
           End
         else
            wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14);
         S := S + wCGC_50 + RMaskCGC_CPF(wNum_Inscricao,14);
         S := S + Bib.AjustaStr(DMCadastro.QCadastroNome.Value, 60);
         S := S + Bib.AjustaStr(DMCadastro.QCadastroDesc_Endereco.Value, 60);
         S := S + Bib.AjustaStr(DMCadastro.QCadastroDesc_Bairro.Value, 30) + '00000';
         S := S + Bib.AjustaStr(DMCadastro.QCadastroDesc_Cidade.Value, 30);
         S := S + Bib.AjustaStr(DMCadastro.QCadastroCod_Estado.Value, 2);
         S := S + RMaskCGC_CPF(DMCadastro.QCadastroDesc_Cep.Value, 8);
         S := S + RMaskCGC_CPF(DMCadastro.QCadastroDesc_Inscricao_Municipal.Value, 15);
         S := S + Chr(13)+Chr(10);
         QRLivroFiscalArquivo.Next;
       End;
       DMCadastro.QCadastro.Close;
       QRLivroFiscalArquivo.First;
       While not QRLivroFiscalArquivo.Eof do
        begin
          QRLivroFiscalFinanceiro.Close;
          QRLivroFiscalFinanceiro.SetVariable('Cod_Nota_Cab',QRLivroFiscalArquivoCod_Nota_Cab.Value);
          QRLivroFiscalFinanceiro.Open;
          While Not(QRLivroFiscalFinanceiro.Eof) do
          Begin
            S := S + '5T';
            wNum_Inscricao := Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,1,1);
            If (wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) Or
               (QRLivroFiscalArquivoIND_FISICA_JURIDICA.Value = 'F') Then
                wNum_Inscricao := 'ISENTO       '
            else
            begin
              x:=0 ;
              wNum_Inscricao := '';
              while x <= Length(QRLivroFiscalArquivoNUM_INSCRICAO.Value) do
              begin
                Inc(x,1);
                if ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) >= '0' ) and
                   ( Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, x, 1) <= '9' ) then
                   wNum_Inscricao := wNum_Inscricao + Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,x,1) ;
              end;
            End;
            If Length(QRLivroFiscalArquivoNUM_CGC_CPF.Value) < 14 Then  // se for menor que 14 se refere a pessoa fisica
              Begin
               If Trim(QRLivroFiscalArquivoNUM_CGC_CPF.Value) = '' Then
                  wCGC_50 := '00000000000000'
               Else
                  wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14)
              End
            else
               wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14);
            S := S + wCGC_50 + RMaskCGC_CPF(wNum_Inscricao,14);
            S := S + FormatDateTime('YYYYMMDD',QRLivroFiscalFinanceiroDt_Emissao.Value);
            S := S + Bib.AjustaStr(QRLivroFiscalFinanceiroCod_Estado.Value, 2);
            S := S + FormatMaskText('CC',Trim(QRLivroFiscalArquivoDesc_Modelo.Value));
            S := S + FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value);
            if length(QRLivroFiscalArquivoNUM_NOTA.Text) > 6 then
              S := S + Copy(QRLivroFiscalArquivoNUM_NOTA.Text,1,6)
            else
              S := S + bib.StrZeroDecimal(QRLivroFiscalArquivoNUM_NOTA.Value,6,0);
            S := S + QRLivroFiscalFinanceiroIND_ENTRADA_SAIDA.Value;
            S := S + FormatMaskText('CCCCCCCCCC','NF');
            S := S + FormatDateTime('YYYYMMDD',QRLivroFiscalFinanceiroDt_Vencimento.Value);
            S := S + bib.StrZeroDecimal(QRLivroFiscalFinanceiroVal_Original.Value,13,2);
            S := S + '0000000000';
            S := S + Chr(13)+Chr(10);
            QRLivroFiscalFinanceiro.Next;
          End;
          QRLivroFiscalArquivo.Next;
        End;
        QRLivroFiscalArquivo.Close;
        QRLivroFiscalFinanceiro.Close;
     End;
    if FLivroFiscalParam.SDlgAMagnetico.Execute then
    begin
      AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    DMLivroFiscal.QRLivroFiscalArquivo.Close;
  end;
end;

procedure TFMenuLivroFiscal.RegistrodeINSS1Click(Sender: TObject);
Var
  wAno,wDia,wMes : Word;
begin
  inherited;
  If FRegINSSParam = Nil Then
    FRegINSSParam := TFRegINSSParam.Create(Application);
  FRegINSSParam.PGRelatorio.Pages[0].TabVisible := True;
  if FRegINSSParam.ShowModal = mrok then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(FRegINSSParam.ME0Filial.Text),'LIVRO FISCAL');
     if Trim(FRegINSSParam.ME0Filial.Text) = '' Then
       Raise Exception.Create('Filial não informada!');
     with DMRegINSS do
     begin
       QRegINSS.Close;
       QRegINSS.SetVariable('COD_FILIAL',FRegINSSParam.ME0Filial.Text);
       QRegINSS.SetVariable('DATA_I',FRegINSSParam.ME0DT_Emissao_I.Text);
       QRegINSS.SetVariable('DATA_F',FRegINSSParam.ME0DT_Emissao_F.Text);
       QRegINSS.Open;
      End;
     if FRRegINSS = nil then
        FRRegINSS := TFRRegINSS.Create(Application);
     with DMFilial do
     begin
       DecodeDate(StrToDate(FRegINSSParam.ME0Dt_Emissao_I.Text),wAno,wMes,wDia);
       FRRegINSS.QRLMes.Caption:=FloatToStr(wMes);
       FRRegINSS.QRLAno.Caption:=FloatToStr(wAno);
     End;
     FRRegINSS.QRPrimario.Preview;
     DMRegINSS.QRegINSS.Close;
  End;
end;

procedure TFMenuLivroFiscal.RegistrodeServiosPrestados1Click(
  Sender: TObject);
begin
  inherited;
  If FRegServPrestadosParam = Nil Then
    FRegServPrestadosParam := TFRegServPrestadosParam.Create(Application);
  FRegServPrestadosParam.PGRelatorio.Pages[0].TabVisible := True;
  FRegServPrestadosParam.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivodeRegistrodeEntradas1Click(
  Sender: TObject);
var
  wstrS, wstrSinal,wQbInscricao:String;
  F : TextFile;
  cont, cont1:integer;
  total : Real;
Begin
  inherited;
  wstrS := '';
  wstrSinal := '';
  cont := 0;
  cont1 := 0;
  total := 0;
  If FlivroFiscalParam = Nil Then
    FlivroFiscalParam := TFlivroFiscalParam.Create(Application);
  FlivroFiscalParam.PGRelatorio.Pages[9].TabVisible := True;
  If(FlivroFiscalParam.ShowModal = mrOk) Then
  Begin
    With DmRegEntrada do
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME9Filial.Text),'LIVRO FISCAL');
      If ( (Trim(FlivroFiscalParam.Me9DataI.Text) = '') OR (Trim(FlivroFiscalParam.Me9DataF.Text) = '') ) Then
        raise Exception.Create('É necessário informar um Período!');
      QRegEntradaProdPrimario.Close;
      QRegEntradaProdPrimario.SetVariable( 'DATA_I', Trim(FlivroFiscalParam.Me9DataI.Text) );
      QRegEntradaProdPrimario.SetVariable( 'DATA_F', Trim(FlivroFiscalParam.Me9DataF.Text) ) ;
      If Trim(FlivroFiscalParam.Me9Filial.Text) <> '' Then
        QRegEntradaProdPrimario.SetVariable( 'COD_FILIAL', Trim(FlivroFiscalParam.Me9Filial.Text) )
      Else
        QRegEntradaProdPrimario.SetVariable( 'COD_FILIAL', Null );
      If Trim(FlivroFiscalParam.Me9Cidade.Text) <> '' Then
        QRegEntradaProdPrimario.SetVariable( 'COD_CIDADE', Trim(FlivroFiscalParam.Me9Cidade.Text) )
      Else
        QRegEntradaProdPrimario.SetVariable( 'COD_CIDADE', Null );
      QRegEntradaProdPrimario.Open;
      QRegEntradaProdPrimario.First;
      If QRegEntradaProdPrimario.IsEmpty Then
        raise Exception.Create('Não existem registros a serem gerados no período!');
      wstrS := '1'                                                                                     +
      Bib.FormataTexto( Trim(FlivroFiscalParam.Ed9Filial.Text), 8)                                     +
      FormatDateTime( 'DDMMYYYY',  (DmOracle.DataServ))                                                +
      FormatDateTime( 'DDMMYYYY', STRTODATE(Trim(FlivroFiscalParam.Me9DataI.Text )))                   +
      FormatDateTime( 'DDMMYYYY', STRTODATE(Trim(FlivroFiscalParam.Me9DataF.Text )))                   +
      Chr(13)+Chr(10);
      //wQbInscricao := QRegEntradaProdPrimarioNUM_NOTA.Text;
      While (not QRegEntradaProdPrimario.Eof) Do
      Begin
        If wQbInscricao <> QRegEntradaProdPrimarioNUM_NOTA.Text then
        Begin
         total := total + (QRegEntradaProdPrimarioVAL_TOTAL.Value);
         wQbInscricao := QRegEntradaProdPrimarioNUM_NOTA.Text;
         If QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text = 'D' then
           wstrSinal := '-'
         else
           wstrsinal := ' ';
         cont := cont + 1;
         wstrS :=  wstrs + '2'                                                                          +
         RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_CGC.Text), 14 )                                  +
         RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NOTA.Text), 9 )                                  +
         Bib.FormataTexto( Trim(QRegEntradaProdPrimarioCOD_SERIE.Text), 2)                              +
         FormatDateTime( 'DDMMYYYY', QRegEntradaProdPrimarioDT_EMISSAO.Value)                           +
         RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_CGC_CPF.Text), 14 )                              +
         (QRegEntradaProdPrimarioIND_FISICA_JURIDICA.Text)                                              +
         Bib.FormataTexto( Trim(QRegEntradaProdPrimarioNOME.Text), 40)                                  +
         Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_ENDERECO.Text), 40)                         +
         Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_BAIRRO.Text), 20)                           +
          {If Trim(QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text) = 'F' Then
          wstrS := wstrS + RMaskCGC_CPF('0', 14);
          If Trim(QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text) <> 'F' Then
          wstrS := wstrS + RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioPESO.Text), 11 );}
         RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_CIDADE.Text), 5 );
         If QRegEntradaProdPrimarioCOD_ESTADO.Text = 'PR' then
           wstrs:= wstrs + RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NATUREZA_EST_NOVO.Text), 4 )
         else
           wstrs:= wstrs + RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NATUREZA_INT_NOVO.Text), 4 );
         wstrs:= wstrs + '000000000';
         wstrs:= wstrs + RMaskCGC_CPF(FloatToStr(Trunc(QRegEntradaProdPrimarioVAL_TOTAL.Value * 100)), 12 )   +
         RMaskCGC_CPF( FloatToStr(Trunc(QRegEntradaProdPrimarioVAL_TOTAL.Value * 100)), 11 );
        If QRegEntradaProdPrimarioInd_Fixar_Empresa.Value = 'D' then
           wstrSinal := '-';
         wstrs:= wstrs + wstrSinal                                                                      +
         RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_ITEM.Text), 2)                                   +
         Chr(13)+Chr(10);
          //QRegEntradaProdPrimario.Next;
        End;
        cont1 := cont1 + 1;
        wstrSinal := ' ';
        wstrS := wstrs + '3'                                                                           +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_CGC.Text), 14)                                   +
        RMaskCGC_CPF ( Trim(QRegEntradaProdPrimarioNUM_NOTA.Text), 9)                                  +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_PRODUTO.Text), 14);
        If QRegEntradaProdPrimarioInd_Fixar_Empresa.Value = 'F' Then
           wstrS := wstrs + '00000000000'
        Else
           wstrS := wstrs + RMaskCGC_CPF( FloatToStr(Trunc(QRegEntradaProdPrimarioQT_QUANTIDADE.Value * 100)), 11);
        If QRegEntradaProdPrimarioInd_Fixar_Empresa.Value = 'D' then
          wstrSinal := '-';
        wstrs:= wstrs + wstrSinal                                                                      +
        Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_UNIDADE.Text), 5)                           +
        RMaskCGC_CPF( FloatToStr(Trunc(QRegEntradaProdPrimarioVAL_UNITARIO.Value * 100)), 12)                 +
        RMaskCGC_CPF( FloatToStr(Trunc(QRegEntradaProdPrimarioVAL_TOTAL.Value * 100)), 11);
        If QRegEntradaProdPrimarioInd_Fixar_Empresa.Value = 'D' then
          wstrSinal := '-';
        wstrs := wstrs + wstrSinal                                                                     +
        Chr(13)+Chr(10);
        QRegEntradaProdPrimario.Next;
      End;
      wstrS := wstrs + '9'                                                                             +
      RMaskCGC_CPF (IntToStr(cont),6)                                                                  +
      RMaskCGC_CPF (IntToStr(cont + cont1 + 2),6)                                                      +
      RMaskCGC_CPF(FloatToStr(total * 100),12);
    End;

    If wstrS <> '' Then
    Begin
      If FLivroFiscalParam.SDlgAMagnetico.Execute then
       Begin
         AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
         Rewrite(F);
         Writeln(F, wstrS);
         CloseFile(F);
         MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
       End
      Else
        MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    End;
    DMRegEntrada.QRegEntradaProdPrimario.Close;
  End;
End;

procedure TFMenuLivroFiscal.RegistrodeNotas1Click(Sender: TObject);
begin
  inherited;
  If FRegNota = Nil Then
    FRegNota := TFRegNota.Create(Application);
  DMTela.VerificaTela(pModulo,FRegNota.Caption,FRegNota.Name);
  FRegNota.ShowModal;
end;

procedure TFMenuLivroFiscal.GerarArquivoMagnticoGisSt1Click(
  Sender: TObject);
var
  F : TextFile;
  wA0, wA1, wA2, wA3, wDesc_Inscricao                    : String;
  wCgc, wCidade, wInscricao                              : String;
  wContato, wDesc_wCnpj, s, wPula                        : String;
  wTot_A1, wTot_A2, wTot_A3, x                           : Integer;
  wTotProdutos, wTotIpi, wTotBase, wTotIcms, wTotBaseSub, wTotIcmsSub, wTotIcmsDev : Real;
Begin
  inherited;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[12].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME12Filial.Text),'LIVRO FISCAL');
    QArquivo_GiaSt.Close;
    Case FLivroFiscalParam.Rg12TipoNota.ItemIndex Of
      0 : QArquivo_GiaSt.SetVariable('ENTRADA_SAIDA','E');
      1 : QArquivo_GiaSt.SetVariable('ENTRADA_SAIDA','S');
      2 : QArquivo_GiaSt.SetVariable('ENTRADA_SAIDA',Null);
    End;
    If Trim(FLivroFiscalParam.Me12Estado.Text) <> '' Then
       QArquivo_GiaSt.SetVariable('COD_ESTADO',Trim(FLivroFiscalParam.Me12Estado.Text))
    Else
       QArquivo_GiaSt.SetVariable('COD_ESTADO',Null);

    If Trim(FLivroFiscalParam.Me12Filial.Text) <> '' Then
       QArquivo_GiaSt.SetVariable('COD_FILIAL',Trim(FLivroFiscalParam.Me12Filial.Text))
    Else
       QArquivo_GiaSt.SetVariable('COD_FILIAL',Null);

    QArquivo_GiaSt.SetVariable('DATA_INICIAL',FLivroFiscalParam.Me12DtInicial.Text);
    QArquivo_GiaSt.SetVariable('DATA_FINAL',FLivroFiscalParam.Me12DtFinal.Text);

    QArquivo_GiaSt.Open;

    wTot_A1 := 0;
    wTot_A2 := 0;
    wTot_A3 := 0;
    wA0 := '';
    wA1 := '';
    wA2 := '';
    wA3 := '';
    wTotProdutos := 0;
    wTotIpi := 0;
    wTotBase := 0;
    wTotIcms := 0;
    wTotBaseSub := 0;
    wTotIcmsSub := 0;
    wTotIcmsDev := 0;
    wPula := 'NAO';
    While not QArquivo_GiaSt.Eof do
    begin
      wTotProdutos := wTotProdutos + QArquivo_GiaStVal_Total.Value;
      wTotIpi := wTotIpi + QArquivo_GiaStVal_Ipi.Value;
      wTotBase := wTotBase + QArquivo_GiaStVal_Icm_Base.Value;
      wTotIcms := wTotIcms + QArquivo_GiaStVal_Icm.Value;
      wTotBaseSub := wTotBaseSub + QArquivo_GiaStVal_Base_Substituicao.Value;
      wTotIcmsSub := wTotIcmsSub + QArquivo_GiaStVal_Icms_Substituicao.Value;
      wDesc_Inscricao := Copy(QArquivo_GiaStNum_Inscricao.Value,1,1);
      if ( wDesc_Inscricao = 'I' ) Or ( wDesc_Inscricao = '' ) then
         wDesc_Inscricao := 'ISENTO       '
      else
      begin
        x:=1 ;
        WDesc_Inscricao := '';  // Inicializa valor da variavel
        while x <= Length(QArquivo_GiaStNum_Inscricao.Value) do
        begin
          if ( Copy(QArquivo_GiaStNum_Inscricao.Value, x, 1) >= '0' ) and
             ( Copy(QArquivo_GiaStNum_Inscricao.Value, x, 1) <= '9' ) then
             wDesc_Inscricao := wDesc_Inscricao + Copy(QArquivo_GiaStNum_Inscricao.Value,x,1) ;
             Inc(x,1);
        end;
      end;
      If QArquivo_GiaStIND_VENDAS.Value = 'D' Then // nota fiscal devolução
       Begin
         If wPula = 'SIM' Then
           wA1:= wA1 + Chr(13)+Chr(10);
         wTot_A1 := wTot_A1 + 1 ;
         wA1:= wA1 + 'A1'                                                  + { Tipo }
         bib.StrZeroDecimal(QArquivo_GiaStNUM_NOTA.Value,8,0)                   +
         FormatMaskText('CCC',Trim(QArquivo_GiaStCOD_SERIE.Value))   +
         FormatMaskText('CCCCCCCCCCCCCC',Trim(wDesc_Inscricao))             +
         Copy(QArquivo_GiaStDT_EMISSAO.Text,7,4)                     +  {Ano}
         Copy(QArquivo_GiaStDT_EMISSAO.Text,4,2)                     +  {Mes}
         Copy(QArquivo_GiaStDT_EMISSAO.Text,1,2)                     +  {Dia}
         bib.StrZeroDecimal(QArquivo_GiaStVAL_ICMS_SUBSTITUICAO.Value,15,2);
         wTotIcmsDev := wTotIcmsDev + QArquivo_GiaStVal_Icm.Value;
         wPula := 'SIM'; // SOMENTE PARA NAO PULAR NA PRIMEIRA VEZ VARIAVEL INICIA COM NAO
       End;
{      Else
       Begin
         If wPula = 'SIM' Then
           wA2:= wA2 + Chr(13)+Chr(10);
         wTot_A2 := wTot_A2 + 1 ;
         wA2:= wA2 + 'A2'                                                  +
         bib.StrZeroDecimal(QArquivo_GiaStNUM_NOTA.Value,8,0)                         +
         FormatMaskText('CCC',Trim(QArquivo_GiaStCOD_SERIE.Value))         +
         FormatMaskText('CCCCCCCCCCCCCC',Trim(wDesc_Inscricao))            +
         Copy(QArquivo_GiaStDT_EMISSAO.Text,7,4)                           +
         Copy(QArquivo_GiaStDT_EMISSAO.Text,4,2)                           +
         Copy(QArquivo_GiaStDT_EMISSAO.Text,1,2)                           +
         bib.StrZeroDecimal(QArquivo_GiaStVAL_ICMS_SUBSTITUICAO.Value,15,2);
         wPula := 'SIM'; // SOMENTE PARA NAO PULAR NA PRIMEIRA VEZ VARIAVEL INICIA COM NAO
       End;
}      If QArquivo_GiaStVal_Icm.Value > 0 Then
       Begin
         If wPula = 'SIM' Then
           wA3:= wA3 + Chr(13)+Chr(10);
         wTot_A3 := wTot_A3 + 1 ;
         wA3:= wA3 + 'A3'                                                  + { Tipo }
         FormatMaskText('CCCCCCCCCCCCCC',Trim(wDesc_Inscricao))             +
         bib.StrZeroDecimal(QArquivo_GiaStVAL_ICM_BASE.Value,15,2)              +
         bib.StrZeroDecimal(QArquivo_GiaStVAL_ICM.Value,15,2);
       End;
       wPula := 'SIM'; // SOMENTE PARA NAO PULAR NA PRIMEIRA VEZ VARIAVEL INICIA COM NAO
       QArquivo_GiaSt.Next;  // Pula para proximo registro.
    end;

    wCgc       := DMOracle.BuscaNome('SELECT NUM_CGC           FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME12Filial.Text));
    wCidade    := DMOracle.BuscaNome('SELECT DESC_CIDADE       FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME12Filial.Text));
    wInscricao := DMOracle.BuscaNome('SELECT DESC_INSCRICAO_SUBST  FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+Trim(FLivroFiscalParam.ME12Estado.Text)+Chr(39));
    wContato   := DMOracle.BuscaNome('SELECT DESC_NOME_CONTATO FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.ME12Filial.Text));

    // Pega tamanho do Inscricao
    // -------------------------------------------------- \\
    wDesc_Inscricao := Copy(wInscricao,1,1);

    if ( wDesc_Inscricao = 'I' ) Or ( wDesc_Inscricao = '' ) then
       wDesc_Inscricao := 'ISENTO       '
    else
    begin
      x:=1 ;
      WDesc_Inscricao := '';  // Inicializa valor da variavel
      while x <= Length(wInscricao) do
      begin
        if ( Copy(wInscricao, x, 1) >= '0' ) and
           ( Copy(wInscricao, x, 1) <= '9' ) then
           wDesc_Inscricao := wDesc_Inscricao + Copy(wInscricao,x,1) ;
           Inc(x,1);
      end;
    end;

    x:=1 ;
    wDesc_wCnpj := '';  // Inicializa valor da variavel
    while x <= Length(wCgc) do
    begin
      if ( Copy(wCgc, x, 1) >= '0' ) and
         ( Copy(wCgc, x, 1) <= '9' ) then
         wDesc_wCnpj := wDesc_wCnpj + Copy(wCgc,x,1) ;
         Inc(x,1);
    end;

    wA0 := 'A0GST02'                                                        +
           Copy(FLivroFiscalParam.Me12DtInicial.Text,4,2)                   +  {Mes}
           Copy(FLivroFiscalParam.Me12DtFinal.Text,7,4)                     +  {Ano}
           FormatMaskText('CCCCCCCCCCCCCC',(Trim(wDesc_Inscricao)));
    Case FLivroFiscalParam.Rg12Arquivo.ItemIndex of
      0 : wA0 := wA0 + '  ';
      1 : wA0 := wA0 + ' X';
      2 : wA0 := wA0 + 'X ';
    End;
    wA0 := wA0 + Copy(FLivroFiscalParam.Me12DtFinal.Text,7,4) + Copy(FLivroFiscalParam.Me12DtFinal.Text,4,2) + Copy(FLivroFiscalParam.Me12DtFinal.Text,1,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcmsSub,15,2);
    wA0 := wA0 + '00000000000000000000000';
    wA0 := wA0 + '00000000000000000000000';
    wA0 := wA0 + '00000000000000000000000';
    wA0 := wA0 + '00000000000000000000000';
    wA0 := wA0 + '00000000000000000000000';

    wA0 := wA0 + FLivroFiscalParam.Me12Estado.Text;
    wA0 := wA0 + bib.StrZeroDecimal(wTotProdutos,15,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotIpi,15,2);
    wA0 := wA0 + '000000000000000';
    wA0 := wA0 + bib.StrZeroDecimal(wTotBase,15,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcms,15,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotBaseSub,15,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcmsSub,15,2);
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcmsDev,15,2);
    wA0 := wA0 + '000000000000000'; //icms ressarcimentos
    wA0 := wA0 + '000000000000000';  //credito do periodo anterior
    wA0 := wA0 + '000000000000000';  //pagamentos antecipados
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcmsSub,15,2);  //ICMS-ST devido
    wA0 := wA0 + '000000000000000';  //Repasse de ICMS-ST ref combustiveis
    wA0 := wA0 + '000000000000000'; //credito para periodo seguinte
    wA0 := wA0 + bib.StrZeroDecimal(wTotIcmsSub,15,2);  //total do ICMS-ST a recolher
    wA0 := wA0 + FormatMaskText('CCCCCCCCCCCCCC',wDesc_wCnpj);
    wA0 := wA0 + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wContato);
    wA0 := wA0 + '02315697930';  //cpf do declarante
    wA0 := wA0 + 'Gerente Administrativo        ';
    wA0 := wA0 + '0045';
    wA0 := wA0 + '02848989';
    wA0 := wA0 + '0045';
    wA0 := wA0 + '02848989';
    wA0 := wA0 + 'rodrigo@faville.com.br                  ';
    wA0 := wA0 + FormatMaskText('CCCCCCCCCCCCCC                ',wCidade);
    wA0 := wA0 + Copy(DateToStr(Date),7,4);
    wA0 := wA0 + Copy(DateToStr(Date),4,2);
    wA0 := wA0 + Copy(DateToStr(Date),1,2);
    wA0 := wA0 + '                                                            ';
    wA0 := wA0 + '                                                            ';
    wA0 := wA0 + '                                                            ';
    wA0 := wA0 + 'NS      ';
    wA0 := wA0 + bib.StrZeroDecimal(wTot_A1,4,0);
    wA0 := wA0 + bib.StrZeroDecimal(wTot_A2,4,0);
    wA0 := wA0 + bib.StrZeroDecimal(wTot_A3,4,0) + Chr(13)+Chr(10);
    S := wA0 + wA1 + wA2 + wA3;
    //------------------ Fim --------------------------\\

    if FLivroFiscalParam.SDlgAMagnetico.Execute then
    begin
      AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    QArquivo_GiaSt.Close;
  end;

end;

procedure TFMenuLivroFiscal.GrupoFiscal1Click(Sender: TObject);
begin
  inherited;
  if FGrupoFiscalCad = nil then
    FGrupoFiscalCad := TFGrupoFiscalCad.create(application);

  DMTela.VerificaTela(pModulo,FGrupoFiscalCad.Caption,FGrupoFiscalCad.Name);
  FGrupoFiscalCad.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivodeRegistrodeEntradasProdutosPrimrios21Click(
  Sender: TObject);
var
  wstrS, wstrS1, wstrS2, wstrSinal,wQbInscricao :String;
  F : TextFile;
Begin
  inherited;
  wstrS := '';
  wstrS1 := '';
  wstrS2 := '';
  wstrSinal := '';
  If FlivroFiscalParam = Nil Then
    FlivroFiscalParam := TFlivroFiscalParam.Create(Application);
  FlivroFiscalParam.PGRelatorio.Pages[9].TabVisible := True;
  If(FlivroFiscalParam.ShowModal = mrOk) Then
  Begin
    With DmRegEntrada do
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME9Filial.Text),'LIVRO FISCAL');
      If ( (Trim(FlivroFiscalParam.Me9DataI.Text) = '') OR (Trim(FlivroFiscalParam.Me9DataF.Text) = '') ) Then
        raise Exception.Create('É necessário informar um Período!');
      QRegEntradaProdPrimario.Close;
      QRegEntradaProdPrimario.SetVariable( 'DATA_I', Trim(FlivroFiscalParam.Me9DataI.Text) );
      QRegEntradaProdPrimario.SetVariable( 'DATA_F', Trim(FlivroFiscalParam.Me9DataF.Text) ) ;
      If Trim(FlivroFiscalParam.Me9Filial.Text) <> '' Then
        QRegEntradaProdPrimario.SetVariable( 'COD_FILIAL', Trim(FlivroFiscalParam.Me9Filial.Text) )
      Else
        QRegEntradaProdPrimario.SetVariable( 'COD_FILIAL', Null );
      If Trim(FlivroFiscalParam.Me9Cidade.Text) <> '' Then
        QRegEntradaProdPrimario.SetVariable( 'COD_CIDADE', Trim(FlivroFiscalParam.Me9Cidade.Text) )
      Else
        QRegEntradaProdPrimario.SetVariable( 'COD_CIDADE', Null );
      QRegEntradaProdPrimario.Open;
      QRegEntradaProdPrimario.First;
      If QRegEntradaProdPrimario.IsEmpty Then
        raise Exception.Create('Não existem registros a serem gerados no período!');
      wstrS := '001'                                                                                     +
      RMaskCGC_CPF( QRegEntradaProdPrimarioDESC_INSCRICAO.Text,10)                                       +   
      Chr(13)+Chr(10);
      //wQbInscricao := QRegEntradaProdPrimarioNUM_NOTA.Text;
      While (not QRegEntradaProdPrimario.Eof) Do
      Begin
        If wQbInscricao <> QRegEntradaProdPrimarioNUM_NOTA.Text then
         Begin
          // total := total + (QRegEntradaProdPrimarioVAL_TOTAL.Value);
           wQbInscricao := QRegEntradaProdPrimarioNUM_NOTA.Text;
           If QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text = 'D' then
             wstrSinal := '-'
           else
             wstrsinal := ' ';
           //cont := cont + 1;
           //wAux := QRegEntradaProdPrimarioNUM_CGC.Text
           wstrS :=  wstrs                                                                                +
           copy(Trim(QRegEntradaProdPrimarioNUM_CGC_CPF.Text),1,14)                                           +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_CIDADE.Text), 5 )                                +
           FormatDateTime( 'DDMMYYYY', QRegEntradaProdPrimarioDT_EMISSAO.Value)                           +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NOTA.Text), 6 )                                  +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioQT_QUANTIDADE.Text), 14);
           If QRegEntradaProdPrimarioQT_QUANTIDADE.Value < 0 then
           wstrSinal := '-';
           wstrS :=  wstrs + wstrsinal                                                                    +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_PRODUTO.Text), 6)                                +
           RMaskCGC_CPF( FloatToStr(Trunc(QRegEntradaProdPrimarioVAL_TOTAL.Value * 100)), 13);
           If QRegEntradaProdPrimarioVAL_TOTAL.Value < 0 then
           wstrSinal := '-';
           wstrS :=  wstrs + wstrsinal                                                                    +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NOTA.Text), 6 )                                  +
           Chr(13)+Chr(10);

           wstrS1 :=  wstrs1                                                                              +
           copy(Trim(QRegEntradaProdPrimarioNUM_CGC_CPF.Text),1,14 )                                      +
           Bib.FormataTexto( Trim(QRegEntradaProdPrimarioNOME.Text), 50)                                  +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_CIDADE.Text), 5 )                                +
           Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_ENDERECO.Text), 50)                         +
           Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_BAIRRO.Text), 50)                           +
           RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioDESC_CEP.Text), 8)                                   +
           copy( Trim(QRegEntradaProdPrimarioDESC_HOBBIE.Text),1,15)                                     +
           Chr(13)+Chr(10);
          End;

        //While (not QRegEntradaProdPrimario.Eof) Do
       // Begin
          wstrS2 := wstrs2                                                                               +
          RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_PRODUTO.Text), 6)                                +
          Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_PRODUTO.Text), 40)                          +
          Bib.FormataTexto( Trim(QRegEntradaProdPrimarioDESC_UNIDADE.Text), 5)                           +
          Chr(13)+Chr(10);
          QRegEntradaProdPrimario.Next;
        end;


       If wstrS1 <> '' Then
        Begin
          FLivroFiscalParam.SDlgAMagnetico.FileName := 'PRODUTOR';
          If FLivroFiscalParam.SDlgAMagnetico.Execute then
           Begin
             AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
             Rewrite(F);
             Writeln(F, wstrS1);
             CloseFile(F);
             MessageDlg('Arquivo de Produtores Gerado com Sucesso!', mtInformation,[mbOk], 0);
           End
          Else
            MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
       End;

       If wstrS <> '' Then
        Begin
          FLivroFiscalParam.SDlgAMagnetico.FileName := 'NOTAS';
          If FLivroFiscalParam.SDlgAMagnetico.Execute then
           Begin
             AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
             Rewrite(F);
             Writeln(F, wstrS);
             CloseFile(F);
             MessageDlg('Arquivo de Notas Gerado com Sucesso!', mtInformation,[mbOk], 0);
           End
          Else
            MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
        end;

       If wstrS2 <> '' Then
        Begin
          FLivroFiscalParam.SDlgAMagnetico.FileName := 'PRODUTOS';
          If FLivroFiscalParam.SDlgAMagnetico.Execute then
           Begin
             AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
             Rewrite(F);
             Writeln(F, wstrS2);
             CloseFile(F);
             MessageDlg('Arquivo de Produtos Gerado com Sucesso!', mtInformation,[mbOk], 0);
           End
          Else
            MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
        End;
    DMRegEntrada.QRegEntradaProdPrimario.Close;
  End;
  End;
end;

procedure TFMenuLivroFiscal.GerarArquivoSiscredi1Click(Sender: TObject);
Var wstrS, wAux, wArquivo :String;
    F : TextFile;
    wCont, x :integer;
begin
  inherited;
  wstrS := '';
  If FSiscrediParam = Nil Then
     FSiscrediParam := TFSiscrediParam.Create(Application);
  FSiscrediParam.PGRelatorio.Pages[0].TabVisible := True;
  If FSiscrediParam.ShowModal = MrOk Then
   Begin
     DMSiscredi.QSiscredi.Close;
     DMSiscredi.QSiscredi.Sql.Clear;
     DMSiscredi.QSiscredi.Sql.Add('Select TB_FILIAL.NUM_CGC,TB_FILIAL.DESC_INSCRICAO,TB_NOTA_CAB.NUM_NOTA,TB_NOTA_CAB.COD_SERIE,');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.DT_EMISSAO,TB_NOTA_CAB.NUM_DESPACHO_EXPORTACAO,TB_NOTA_CAB.DESC_MEMORANDO_EXPORTACAO,TB_NOTA_CAB.VAL_DESPESAS,');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.VAL_DESCONTO,TB_NOTA_CAB.VAL_FUNRURAL,DECODE(TB_FILIAL.COD_ESTADO,TB_NOTA_CAB.COD_ESTADO,TB_OPERACAO.NUM_NATUREZA_EST_NOVO,NUM_NATUREZA_INT_NOVO) AS NAT_OPERACAO,');
     DMSiscredi.QSiscredi.Sql.Add('TB_PRODUTO.COD_NBM_SH,TB_PRODUTO.DESC_PRODUTO,TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.NUM_INSCRICAO,TB_CADASTRO.NOME,');
     DMSiscredi.QSiscredi.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_ESTADO,SUM(TB_NOTA_ITEM.VAL_ICM_BASE) AS VAL_ICM_BASE,SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_TOTAL,');
     DMSiscredi.QSiscredi.Sql.Add('SUM(TB_NOTA_ITEM.VAL_IPI) AS VAL_IPI,TB_CADASTRO.IND_FISICA_JURIDICA ');
     DMSiscredi.QSiscredi.Sql.Add('FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_CADASTRO,TB_OPERACAO,TB_FILIAL ');
     DMSiscredi.QSiscredi.Sql.Add('WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND ');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO AND ');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND ');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.IND_SITUACAO = ' + Chr(39) + '2' + Chr(39));
     DMSiscredi.QSiscredi.Sql.Add(' AND TB_OPERACAO.IND_EMITE = ' + Chr(39) + 'F' + Chr(39));
     DMSiscredi.QSiscredi.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FSiscrediParam.Me0DtInicial.Text) + Chr(39));
     DMSiscredi.QSiscredi.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FSiscrediParam.Me0DtFinal.Text) + Chr(39));
     If Trim(FSiscrediParam.Me0Filial.Text) <> ''  Then
       DMSiscredi.QSiscredi.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FSiscrediParam.Me0Filial.Text));
     If Trim(FSiscrediParam.Me0Estado.Text) <> ''  Then
       DMSiscredi.QSiscredi.Sql.Add(' AND TB_FILIAL.COD_ESTADO = ' + Chr(39) + Trim(FSiscrediParam.Me0Estado.Text) + Chr(39));
     if FSiscrediParam.LB0Operacoes.Count > 0 then
       DMSiscredi.QSiscredi.Sql.Add(' And ( ');
     For wCont := 0 to FSiscrediParam.Lb0Operacoes.Items.Count - 1 do
     Begin
       wAux := Copy(FSiscrediParam.Lb0Operacoes.Items[wCont],1,6);
       If wCont > 0 Then
          DMSiscredi.QSiscredi.Sql.Add(' Or ');
       DMSiscredi.QSiscredi.Sql.Add(' (Tb_Nota_Cab.Cod_Operacao = ' + wAux + ') ');
     End;
     if FSiscrediParam.LB0Operacoes.Count > 0 then
       DMSiscredi.QSiscredi.Sql.Add(' ) ');  // fecha parenteses para cod operacao
     if FSiscrediParam.Lb0Tributacao.Count > 0 then
       DMSiscredi.QSiscredi.Sql.Add(' And ( '); // abre parenteses para cod tributacao
     For wCont := 0 to FSiscrediParam.Lb0Tributacao.Items.Count - 1 do
     Begin
       wAux := Copy(FSiscrediParam.Lb0Tributacao.Items[wCont],1,6);
       If wCont > 0 Then
          DMSiscredi.QSiscredi.Sql.Add(' Or ');
       DMSiscredi.QSiscredi.Sql.Add(' (Tb_Nota_Item.Cod_Tributacao = ' + wAux + ') ');
     End;
     if FSiscrediParam.Lb0Tributacao.Count > 0 then
       DMSiscredi.QSiscredi.Sql.Add(' ) ');
     DMSiscredi.QSiscredi.Sql.Add(' GROUP BY TB_FILIAL.NUM_CGC,TB_FILIAL.DESC_INSCRICAO,TB_NOTA_CAB.NUM_NOTA,TB_NOTA_CAB.COD_SERIE,');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.DT_EMISSAO,TB_NOTA_CAB.NUM_DESPACHO_EXPORTACAO,TB_NOTA_CAB.DESC_MEMORANDO_EXPORTACAO,TB_NOTA_CAB.VAL_DESPESAS,');
     DMSiscredi.QSiscredi.Sql.Add('TB_NOTA_CAB.VAL_DESCONTO,TB_NOTA_CAB.VAL_FUNRURAL,DECODE(TB_FILIAL.COD_ESTADO,TB_NOTA_CAB.COD_ESTADO,TB_OPERACAO.NUM_NATUREZA_EST_NOVO,NUM_NATUREZA_INT_NOVO),');
     DMSiscredi.QSiscredi.Sql.Add('TB_PRODUTO.COD_NBM_SH,TB_PRODUTO.DESC_PRODUTO,TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.NUM_INSCRICAO,TB_CADASTRO.NOME,');
     DMSiscredi.QSiscredi.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_ESTADO,TB_CADASTRO.IND_FISICA_JURIDICA');
     Bib.QueryToLog(DMSiscredi.QSiscredi);
     DMSiscredi.QSiscredi.Open;
     DMSiscredi.QSiscredi.First;
     If DMSiscredi.QSiscredi.IsEmpty Then
       raise Exception.Create('Não existem registros a serem gerados no período!');
     wstrS := '';
     While (not DMSiscredi.QSiscredi.Eof) Do
     Begin
       Case FSiscrediParam.Rg0Tipo.ItemIndex of
         0 :  wstrS := wstrS + '1';
         1 :  wstrS := wstrS + '2';
         2 :  wstrS := wstrS + '3';
         3 :  wstrS := wstrS + '4';
         4 :  wstrS := wstrS + '5';
       End;
       x := 1 ;
       wAux := '';  // Inicializa valor da variavel
       while x <= Length(DMSiscredi.QSiscrediNum_Cgc.Value) do
       begin
         if ( Copy(DMSiscredi.QSiscrediNum_Cgc.Value, x, 1) >= '0' ) and
            ( Copy(DMSiscredi.QSiscrediNum_Cgc.Value, x, 1) <= '9' ) then
            wAux := wAux + Copy(DMSiscredi.QSiscrediNum_Cgc.Value,x,1) ;
            Inc(x,1);
       end;
       wstrS := wstrS + ';' + wAux;
       wArquivo := wAux + '_' + FormatDateTime( 'YYYYMMDD',Date);; // para guardar que vai formar o nome do arquivo
       x:=1 ;
       wAux := '';  // Inicializa valor da variavel
       while x <= Length(DMSiscredi.QSiscrediDesc_Inscricao.Value) do
       begin
         if ( Copy(DMSiscredi.QSiscrediDesc_Inscricao.Value, x, 1) >= '0' ) and
            ( Copy(DMSiscredi.QSiscrediDesc_Inscricao.Value, x, 1) <= '9' ) then
            wAux := wAux + Copy(DMSiscredi.QSiscrediDesc_Inscricao.Value,x,1) ;
            Inc(x,1);
       end;
       wstrS := wstrS + ';' + wAux;
       wstrS := wstrS + ';' + Trim(DMSiscredi.QSiscrediNum_Nota.Text);
       wStrs := wstrS + ';' + DMSiscredi.QSiscrediCod_Serie.Text;
       wStrs := wstrS + ';' + FormatDateTime( 'DD/MM/YYYY',DMSiscredi.QSiscrediDT_EMISSAO.Value);
       wStrs := wstrS + ';' + DMSiscredi.QSiscrediNat_Operacao.Text;

       // valor contabil
       wAux := FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_CONTABIL.Value));
       wStrs := wstrS + ';' + wAux + ',';  // ESTE PARTE PEGA O VALOR SEM DECIMAL
       wAux := RMaskCGC_CPF(FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_CONTABIL.Value * 100)),11);
       wStrs := wstrS + Copy(wAux,10,2);  // SOMENTE PARTE DECIMAL

       //sub total diferimento
       if FSiscrediParam.Rg0Tipo.ItemIndex = 2 Then
        Begin
          wAux := FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_CONTABIL.Value));
          wStrs := wstrS + ';' + wAux + ','; // ESTE PARTE PEGA O VALOR SEM DECIMAL
          wAux := RMaskCGC_CPF(FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_CONTABIL.Value * 100)),11);
          wStrs := wstrS + Copy(wAux,10,2); // SOMENTE PARTE DECIMAL
        End
       Else
         wStrs := wstrS + ';';

       //Valor cobrado da industria
       if FSiscrediParam.Rg0Tipo.ItemIndex = 3 Then
        Begin
//          wAux := RMaskCGC_CPF( FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_ICM_BASE.Value * 100)), 11);
//          wStrs := wstrS + ';' + Copy(wAux,1,9) + ','+ Copy(wAux,10,2);
            wStrs := wStrs + ';0'; // quanto tiver o valor tirar fora este campo
        End
       Else
         wStrs := wstrS + ';';

       //base de calculo
       if FSiscrediParam.Rg0Tipo.ItemIndex = 4 Then
        Begin
          wAux := FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_ICM_BASE.Value));
          wStrs := wstrS + ';' + wAux + ',';
          wAux := RMaskCGC_CPF(FloatToStr(Trunc(DMSiscredi.QSiscrediVAL_ICM_BASE.Value * 100)),11);
          wStrs := wstrS + Copy(wAux,10,2);
        End
       Else
         wStrs := wstrS + ';';

       // despacho exportacao
       if (FSiscrediParam.Rg0Tipo.ItemIndex = 0) Then
//          (FSiscrediParam.Rg0Tipo.ItemIndex = 1) Then  // foi deixado para exportacao indireta o memorando de exportacao cfe manual
          wStrs := wstrS + ';' + DMSiscredi.QSiscrediNum_Despacho_Exportacao.Text
       Else
          wStrs := wstrS + ';';

       // memorando exportacao
       if FSiscrediParam.Rg0Tipo.ItemIndex = 1 Then
          wStrs := wstrS + ';' + DMSiscredi.QSiscrediDesc_Memorando_Exportacao.Text
       Else
          wStrs := wstrS + ';';

       // NBM/SH E DESCRICAO DO PRODUTO
       if FSiscrediParam.Rg0Tipo.ItemIndex = 4 Then
        Begin
          wStrs := wStrS + ';' + DMSiscredi.QSiscrediCod_Nbm_Sh.Text;
          wStrs := wStrS + ';' + Trim(Copy(DMSiscredi.QSiscrediDesc_Produto.Text,1,53));
        End
       Else
         wStrs := wStrS + ';;';

       // CNPJ DESTINATARIO
       if DMSiscredi.QSiscrediInd_Fisica_Juridica.Value = 'J' Then
        Begin
         if FSiscrediParam.Rg0Tipo.ItemIndex <> 0 Then
          Begin
           x:=1 ;
           wAux := '';  // Inicializa valor da variavel
           while x <= Length(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text) do
           begin
             if ( Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text, x, 1) >= '0' ) and
                ( Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text, x, 1) <= '9' ) then
                wAux := wAux + Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text,x,1) ;
                Inc(x,1);
           end;
           wstrS := wstrS + ';' + wAux;
          end
         Else
          wstrS := wstrS + ';'
        End
       Else
         wstrS := wstrS + ';';

       // inscricao estadual destinatario
       if DMSiscredi.QSiscrediInd_Fisica_Juridica.Value = 'J' Then
        Begin
          if FSiscrediParam.Rg0Tipo.ItemIndex <> 0 Then
           Begin
            x:=1 ;
            wAux := '';  // Inicializa valor da variavel
            while x <= Length(DMSiscredi.QSiscrediNum_Inscricao.Text) do
            begin
              if ( Copy(DMSiscredi.QSiscrediNum_Inscricao.Text, x, 1) >= '0' ) and
                 ( Copy(DMSiscredi.QSiscrediNum_Inscricao.Text, x, 1) <= '9' ) then
                 wAux := wAux + Copy(DMSiscredi.QSiscrediNum_Inscricao.Text,x,1) ;
                 Inc(x,1);
            end;
            wstrS := wstrS + ';' + wAux;
           End
          Else
           wstrS := wstrS + ';'
        End
       Else
         wstrS := wstrS + ';';

       // CPF DESTINATARIO
       if DMSiscredi.QSiscrediInd_Fisica_Juridica.Value <> 'J' Then
        Begin
          if FSiscrediParam.Rg0Tipo.ItemIndex <> 0 Then  // gera cpf para todos 
           Begin
            x:=1 ;
            wAux := '';  // Inicializa valor da variavel
            while x <= Length(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text) do
            begin
              if ( Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text, x, 1) >= '0' ) and
                 ( Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text, x, 1) <= '9' ) then
                 wAux := wAux + Copy(DMSiscredi.QSiscrediNum_Cgc_Cpf.Text,x,1) ;
                 Inc(x,1);
            end;
            wstrS := wstrS + ';' + wAux;
           end
          Else
           wstrS := wstrS + ';'
        End
       Else
         wstrS := wstrS + ';';

       // NOME DESTINATARIO
       wStrs := wStrS + ';' + Trim(DMSiscredi.QSiscrediNome.Text);

       // MUNICIPIO DESTINATARIO
       if FSiscrediParam.Rg0Tipo.ItemIndex <> 0 Then
          wStrs := wStrS + ';' + Trim(DMSiscredi.QSiscrediDesc_Cidade.Text)
       Else
          wStrs := wStrS + ';';

       // UF DESTINATARIO
       wStrs := wStrS + ';' + Trim(DMSiscredi.QSiscrediCod_Estado.Text);
       wStrs := wStrS + Chr(13)+Chr(10);
       DMSiscredi.QSiscredi.Next;
     end;
     If wstrS <> '' Then
      Begin
        FSiscrediParam.SDlgAMagnetico.FileName := wArquivo;
        If FSiscrediParam.SDlgAMagnetico.Execute then
         Begin
           AssignFile( F, FSiscrediParam.SDlgAMagnetico.FileName );
           Rewrite(F);
           Writeln(F, wstrS);
           CloseFile(F);
           MessageDlg('Arquivo de Produtos Gerado com Sucesso!', mtInformation,[mbOk], 0);
         End
        Else
          MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
      End;
    DMSiscredi.QSiscredi.Close;
  End;
end;

procedure TFMenuLivroFiscal.GerarArquivoMagnticoReceitaFederal1Click(
  Sender: TObject);
var
  s, enter, aux,wCnpjAnt : string;
  wNumNotaAnt : Real;
  F : TextFile;
  d, m, a : word;
begin
  inherited;
  If FLivroFiscalParam = Nil Then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[17].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrok then
  begin
    With DMRegEntrada do
    Begin
      QRegEntrada.Close;
      if Trim(FLivroFiscalParam.ME17NatOperacao.Text) = '' Then
        QRegEntrada.SetVariable('NAT_OPERACAO',Null)
      else
        QRegEntrada.SetVariable('NAT_OPERACAO',FLivroFiscalParam.ME17NatOperacao.Text);
      QRegEntrada.SetVariable('FILIAL',strtoint(trim(FLivroFiscalParam.ME17Filial.Text)));
      QRegEntrada.SetVariable('DATA_I',strtodate(FLivroFiscalParam.ME17DataI.Text));
      QRegEntrada.SetVariable('DATA_F',strtodate(FLivroFiscalParam.ME17DataF.Text));
      QRegEntrada.Open;
    End;

    s := '';
    enter := '';
    wCnpjAnt := '';
    wNumNotaAnt := 0;
    while not DMRegEntrada.QRegEntrada.eof do
    begin
      if (wCnpjAnt <> DMRegEntrada.QRegEntradaNUM_CGC_CPF.Text) Or
         (wNumNotaAnt <> DMRegEntrada.QRegEntradaNUM_NOTA.Value) Then
      Begin
        s := s + enter;
        s := s + RMaskCGC_CPF(DMRegEntrada.QRegEntradaNUM_CGC_CPF.Text,14);
        s := s + bib.StrZeroDecimal(DMRegEntrada.QRegEntradaNUM_NOTA.Value,6,0);
        s := s + '1  ';{serie}
        s := s + Copy(DMRegEntrada.QRegEntradaDT_EMISSAO.Text,1,2) +  {Dia}
                 Copy(DMRegEntrada.QRegEntradaDT_EMISSAO.Text,4,2) +  {Mes}
                 Copy(DMRegEntrada.QRegEntradaDT_EMISSAO.Text,7,4) ;  {Ano}
        s := s + Copy(DMRegEntrada.QRegEntradaDT_RECEBIMENTO.Text,1,2) +  {Dia}
                 Copy(DMRegEntrada.QRegEntradaDT_RECEBIMENTO.Text,4,2) +  {Mes}
                 Copy(DMRegEntrada.QRegEntradaDT_RECEBIMENTO.Text,7,4) ;  {Ano}
        s := s + RMaskCGC_CPF(DMRegEntrada.QRegEntradaNAT_OPERACAO.Text, 4);
        s := s + bib.StrZeroDecimal(DMRegEntrada.QRegEntradaval_contabil.Value,14,2);
        If DMRegEntrada.QRegEntradaESPECIE.Value <> 'cf' Then
          s := s + bib.StrZeroDecimal(DMRegEntrada.QRegEntradaVAL_IPI.Value,14,2)
        Else
          s := s + bib.StrZeroDecimal(0,14,2);
        s := s + bib.StrZeroDecimal(DMRegEntrada.QRegEntradaVAL_PIS.Value,14,2);
        s := s + bib.StrZeroDecimal(DMRegEntrada.QRegEntradaVAL_COFINS.Value,14,2);
        wNumNotaAnt := DMRegEntrada.QRegEntradaNUM_NOTA.Value;
        wCnpjAnt := DMRegEntrada.QRegEntradaNUM_CGC_CPF.Text;
      End;
      DMRegEntrada.QRegEntrada.Next;
      enter := chr(13)+chr(10);
    end;

    aux := RMaskCGC_CPF(DMRegEntrada.QRegEntradanum_cgc_filial.Value,14);
    DecodeDate(strtodate(FLivroFiscalParam.ME17DataI.Text), a, m, d);

    d := 1; //trimestre
    if m > 3 then
      d := 2;
    if m > 6 then
      d := 3;
    if m > 9 then
      d := 4;

    FLivroFiscalParam.SDlgAMagnetico.FileName := 'LRE' + copy(aux,1,8) + '-' + copy(aux, 9,4) + '-' + copy(aux, 13,2) + '-' + inttostr(a) + '-' + inttostr(d);
    if FLivroFiscalParam.SDlgAMagnetico.Execute then
    begin
      AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  end;
end;

procedure TFMenuLivroFiscal.GerarArquivoMagnticoReceitaFederalSaida1Click(
  Sender: TObject);
var
  s, enter, aux : string;
  F : TextFile;
  d, m, a : word;
begin
  inherited;
  If FLivroFiscalParam = Nil Then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[17].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrok then
  begin
    With DMRegSaida do
    Begin
      QRegSaida.Close;
      if Trim(FLivroFiscalParam.ME17NatOperacao.Text) = '' Then
        QRegSaida.SetVariable('NAT_OPERACAO',Null)
      else
        QRegSaida.SetVariable('NAT_OPERACAO',FLivroFiscalParam.ME17NatOperacao.Text);
      QRegSaida.SetVariable('FILIAL',strtoint(trim(FLivroFiscalParam.ME17Filial.Text)));
      QRegSaida.SetVariable('DATA_I',strtodate(FLivroFiscalParam.ME17DataI.Text));
      QRegSaida.SetVariable('DATA_F',strtodate(FLivroFiscalParam.ME17DataF.Text));
      QRegSaida.Open;
    End;

    s := '';
    enter := '';
    while not DMRegSaida.QRegSaida.eof do
    begin
      s := s + enter;
      s := s + RMaskCGC_CPF(DMRegSaida.QRegSaidaNUM_CGC_CPF.Text,14);
      s := s + bib.StrZeroDecimal(DMRegSaida.QRegSaidaNUM_NOTA.Value,6,0);
      s := s + '1  ';{serie}
      s := s + Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,1,2) +  {Dia}
               Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,4,2) +  {Mes}
               Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,7,4) ;  {Ano}
      s := s + Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,1,2) +  {Dia}
               Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,4,2) +  {Mes}
               Copy(DMRegSaida.QRegSaidaDT_RECEBIMENTO.Text,7,4) ;  {Ano}
      s := s + RMaskCGC_CPF(DMRegSaida.QRegSaidaNAT_OPERACAO.Text, 4);
      s := s + bib.StrZeroDecimal(DMRegSaida.QRegSaidaval_contabil.Value,14,2);
      s := s + bib.StrZeroDecimal(DMRegSaida.QRegSaidaVAL_TOTAL_IPI.Value,14,2);

      DMRegSaida.QRegSaida.Next;
      enter := Chr(13)+Chr(10);
    end;

    aux := RMaskCGC_CPF(DMRegSaida.QRegSaidanum_cgc_filial.Value,14);
    DecodeDate(strtodate(FLivroFiscalParam.ME17DataI.Text), a, m, d);

    d := 1; //trimestre
    if m > 3 then
      d := 2;
    if m > 6 then
      d := 3;
    if m > 9 then
      d := 4;

    FLivroFiscalParam.SDlgAMagnetico.FileName := 'LRS' + copy(aux,1,8) + '-' + copy(aux, 9,4) + '-' + copy(aux, 13,2) + '-' + inttostr(a) + '-' + inttostr(d);

    if FLivroFiscalParam.SDlgAMagnetico.Execute then
    begin
      AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);    
  end;
end;

procedure TFMenuLivroFiscal.RegistrodeEntradasIPI1Click(Sender: TObject);
var wMes, wAno, wDia :Word;
begin
  inherited;
  If FRegEntradaIPIParam = Nil Then
    FRegEntradaIPIParam := TFRegEntradaIPIParam.Create(Application);
  FRegEntradaIPIParam.PGRelatorio.Pages[0].TabVisible := True;
  if FRegEntradaIPIParam.ShowModal = MrOk then

    if FRegEntradaIPIParam.RGTipo.ItemIndex = 0 then    //sintético
      Begin
        with DMRegEntrada do
        begin
        QApuracaoEFilial.Close;
        if Trim(FRegEntradaIPIParam.Me0CodFilial.Text) <> '' then
          QApuracaoEFilial.SetVariable('FILIAL', Trim(FRegEntradaIPIParam.Me0CodFilial.Text))
        else
          Raise Exception.Create('Campo Filial não pode ser nulo');
          QApuracaoEFilial.Open;

          QApuracaoEntrada_Ipi.Close;
          QApuracaoEntrada_Ipi.SetVariable('FILIAL', Trim(FRegEntradaIPIParam.Me0CodFilial.Text));
          QApuracaoEntrada_Ipi.SetVariable('DATA_I', Trim(FRegEntradaIPIParam.Me0DtInicial.Text));
          QApuracaoEntrada_Ipi.SetVariable('DATA_F', Trim(FRegEntradaIPIParam.Me0DtFinal.Text));
          if Trim(FRegEntradaIPIParam.Me0NatOperacao.Text) <> '' then
            QApuracaoEntrada_Ipi.SetVariable('NAT_OPERACAO', Trim(FRegEntradaIPIParam.Me0NatOperacao.Text))
          else
            QApuracaoEntrada_Ipi.SetVariable('NAT_OPERACAO', null);
          QApuracaoEntrada_Ipi.Open;
          If FRRegEntradaIPI = Nil Then
            FRRegEntradaIPI := TFRRegEntradaIPI.Create(Application);

          DecodeDate(StrToDate(FRegEntradaIPIParam.Me0DtInicial.Text),wAno,wMes,wDia);
          FRRegEntradaIPI.QRLabel8.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000',wAno);

          if FRegEntradaIPIParam.RGPreview.ItemIndex = 0 then
            FRRegEntradaIPI.QRPrimario.Preview
          else
            FRRegEntradaIPI.QRPrimario.Print;

          QApuracaoEntrada_Ipi.Close;
          QApuracaoEFilial.Close;
      end;
    end;

    if FRegEntradaIPIParam.RGTipo.ItemIndex = 1 then //analítico
      Begin
        with DMRegEntrada do
        begin
        QApuracaoEFilial.Close;
        if Trim(FRegEntradaIPIParam.Me0CodFilial.Text) <> '' then
          QApuracaoEFilial.SetVariable('FILIAL', Trim(FRegEntradaIPIParam.Me0CodFilial.Text))
        else
          Raise Exception.Create('Campo Filial não pode ser nulo');
          QApuracaoEFilial.Open;

          QApuracaoEntrada_Ipi_Analitico.Close;
          QApuracaoEntrada_Ipi_Analitico.SetVariable('FILIAL', Trim(FRegEntradaIPIParam.Me0CodFilial.Text));
          QApuracaoEntrada_Ipi_Analitico.SetVariable('DATA_I', Trim(FRegEntradaIPIParam.Me0DtInicial.Text));
          QApuracaoEntrada_Ipi_Analitico.SetVariable('DATA_F', Trim(FRegEntradaIPIParam.Me0DtFinal.Text));
          if Trim(FRegEntradaIPIParam.Me0NatOperacao.Text) <> '' then
            QApuracaoEntrada_Ipi_Analitico.SetVariable('NAT_OPERACAO', Trim(FRegEntradaIPIParam.Me0NatOperacao.Text))
          else
            QApuracaoEntrada_Ipi_Analitico.SetVariable('NAT_OPERACAO', null);
          QApuracaoEntrada_Ipi_Analitico.Open;
          If FRRegEntradaIPIAnalitico = Nil Then
            FRRegEntradaIPIAnalitico := TFRRegEntradaIPIAnalitico.Create(Application);

          DecodeDate(StrToDate(FRegEntradaIPIParam.Me0DtInicial.Text),wAno,wMes,wDia);
          FRRegEntradaIPIAnalitico.QRLabel11.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000',wAno);
          FRRegEntradaIPIAnalitico.QRLTitulo.Caption := 'REGISTRO DE ENTRADAS - IPI - ANALÍTICO';
          if FRegEntradaIPIParam.RGPreview.ItemIndex = 0 then
            FRRegEntradaIPIAnalitico.QRPrimario.Preview
          else
            FRRegEntradaIPIAnalitico.QRPrimario.Print;

          QApuracaoEntrada_Ipi_Analitico.Close;
          QApuracaoEFilial.Close;

      end;
    end;
end;

procedure TFMenuLivroFiscal.RegistrodeSaidasIPI1Click(Sender: TObject);
var wMes, wAno, wDia :Word;
begin
  inherited;
   If FRegSaidaIPIParam = Nil Then
    FRegSaidaIPIParam := TFRegSaidaIPIParam.Create(Application);
  FRegSaidaIPIParam.PGRelatorio.Pages[0].TabVisible := True;

  if FRegSaidaIPIParam.ShowModal = MrOk then

  if FRegSaidaIPIParam.RGTipo.ItemIndex = 0 then
  begin
    with DMRegSaida do
    begin
      QApuracaoSFilial.Close;
      if Trim(FRegSaidaIPIParam.Me0CodFilial.Text) <> '' then
        QApuracaoSFilial.SetVariable('FILIAL', Trim(FRegSaidaIPIParam.me0CodFilial.Text))
      else
        Raise Exception.Create('Campo Filial não pode ser nulo');
      QApuracaoSFilial.open;

      QApuracaoSaida_Ipi.Close;
      QApuracaoSaida_Ipi.SetVariable('FILIAL', Trim(FRegSaidaIPIParam.me0CodFilial.Text));
      QApuracaoSaida_Ipi.SetVariable('DATA_I', Trim(FRegSaidaIPIParam.me0DtInicial.Text));
      QApuracaoSaida_Ipi.SetVariable('DATA_F', Trim(FRegSaidaIPIParam.me0DtFinal.Text));
      if Trim(FRegSaidaIPIParam.Me0NatOperacao.Text) <> '' then
        QApuracaoSaida_Ipi.SetVariable('NAT_OPERACAO', Trim(FRegSaidaIPIParam.Me0NatOperacao.Text))
      else
        QApuracaoSaida_Ipi.SetVariable('NAT_OPERACAO', null);

      QApuracaoSaida_Ipi.Open;
      If FRRegSaidaIPI = Nil Then
         FRRegSaidaIPI := TFRRegSaidaIPI.Create(Application);
      DecodeDate(StrToDate(FRegSaidaIPIParam.Me0DtFinal.Text),wAno,wMes,wDia);
      FRRegSaidaIPI.QRLabel8.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000',wAno);

      if FRegSaidaIPIParam.RGPreview.ItemIndex = 0 then
        FRRegSaidaIPI.QRPrimario.Preview
      else
        FRRegSaidaIPI.QRPrimario.Print;

      QApuracaoSaida_Ipi.Close;
      QApuracaoSFilial.Close;
    end;
  end;
  if FRegSaidaIPIParam.RGTipo.ItemIndex = 1 then
  begin
    with DMRegSaida do
    begin
      QApuracaoSFilial.Close;
      if Trim(FRegSaidaIPIParam.Me0CodFilial.Text) <> '' then
        QApuracaoSFilial.SetVariable('FILIAL', Trim(FRegSaidaIPIParam.me0CodFilial.Text))
      else
        Raise Exception.Create('Campo Filial não pode ser nulo');
      QApuracaoSFilial.open;

      QApuracaoSaida_Ipi_Analitico.Close;
      QApuracaoSaida_Ipi_Analitico.SetVariable('FILIAL', Trim(FRegSaidaIPIParam.me0CodFilial.Text));
      QApuracaoSaida_Ipi_Analitico.SetVariable('DATA_I', Trim(FRegSaidaIPIParam.me0DtInicial.Text));
      QApuracaoSaida_Ipi_Analitico.SetVariable('DATA_F', Trim(FRegSaidaIPIParam.me0DtFinal.Text));
      if Trim(FRegSaidaIPIParam.Me0NatOperacao.Text) <> '' then
        QApuracaoSaida_Ipi_Analitico.SetVariable('NAT_OPERACAO', Trim(FRegSaidaIPIParam.Me0NatOperacao.Text))
      else
        QApuracaoSaida_Ipi_Analitico.SetVariable('NAT_OPERACAO', null);

      QApuracaoSaida_Ipi_Analitico.Open;
      If FRRegSaidaIPIAnalitico = Nil Then
         FRRegSaidaIPIAnalitico := TFRRegSaidaIPIAnalitico.Create(Application);
      DecodeDate(StrToDate(FRegSaidaIPIParam.Me0DtFinal.Text),wAno,wMes,wDia);
      FRRegSaidaIPIAnalitico.QRLabel8.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000',wAno);

      if FRegSaidaIPIParam.RGPreview.ItemIndex = 0 then
        FRRegSaidaIPIAnalitico.QRPrimario.Preview
      else
        FRRegSaidaIPIAnalitico.QRPrimario.Print;

      QApuracaoSaida_Ipi_Analitico.Close;
      QApuracaoSFilial.Close;
    end;
  end;
end;

//--------------------------------------------------------------------
procedure TFMenuLivroFiscal.ArquivoMagneticoSC1Click(Sender: TObject);
var
  F : TextFile;
  S, S20, S21, S22, S23, S24, S25, S26, S30, S33, S44, S47, S49, S50, S80, S81, S82, S83, S84, S98, S99 : String;
  wDesc_Inscricao,wInscricao, wFilial : String;
  wTotal1, wTotal2, wTotal3, wTotal4, wTotal5, wTotalDebitos, wTotalCreditos, wAux : Real;
  x, wQtLinhas : Integer;
  wTotMunicipio : Real;
begin
  inherited;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[20].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  begin
    if FLivroFiscalParam.RgArquivoSaida.ItemIndex = 1 then
    begin
    //-------------------------------------------------------------
    {Cabeçalho da procedure Geradora do Arquivo DIME em arquivo .doc em TFArquivoDIMEWordSC

      procedure geraDIMEWord(wCPFContabilista,
                             wContabilista,
                             wFilial,
                             wDataInicial,
                             wDataFinal,
                             wPeriodoReferencia,
                             wTipoDeclaracao,
                             wRegimeApuracao,
                             wPorteEmpresa,
                             wConsolidada,
                             wCentralizada,
                             wTransferencia,
                             wCredito,
                             wIncentivo,
                             wMovimento,
                             wSubsTributario,
                             wEscrita,
                             wQtdeTrabalhadores,
                             wRadioCreditos,
                             wRadioIncentivos : String);
      //---Fim Cabeçalho------------------------------------------
     }
     //procedure Geradora do arquivo DIME via Microsoft Word
     //-----------------------------------------------------------
      if ArquivoDIMEWordSC = Nil then
        ArquivoDIMEWordSC := TArquivoDIMEWordSC.Create;
      ArquivoDIMEWordSC.geraDIMEWord(FLivroFiscalParam.Me20CpfContador.Text, {wCPFContabilista}
                   FLivroFiscalParam.Me20Contador.Text, {wContabilista}
                   FLivroFiscalParam.Fm20Filial.MeFilial.Text, {wFilial}
                   FLivroFiscalParam.Me20DtInicial.Text, {wDataInicial}
                   FLivroFiscalParam.Me20DtFinal.Text, {wDataFinal}
                   (Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2)+Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4)), {wPeriodoReferencia}
                   IntToStr(FLivroFiscalParam.Rg20TipoDeclaracao.ItemIndex + 1), {wTipoDeclaracao}
                   IntToStr(FLivroFiscalParam.Rg20RegimeApuracao.ItemIndex + 1), {wRegimeApuracao}
                   IntToStr(FLivroFiscalParam.Rg20Porte.ItemIndex + 1), {wPorteEmpresa}
                   IntToStr(FLivroFiscalParam.Rg20Consolidada.ItemIndex + 1), {wConsolidada}
                   IntToStr(FLivroFiscalParam.Rg20Centralizada.ItemIndex + 1), {wCentralizada}
                   IntToStr(FLivroFiscalParam.Rg20Transferencia.ItemIndex + 1), {wTransferencia}
                   IntToStr(FLivroFiscalParam.Rg20Creditos.ItemIndex + 1), {wCredito}
                   IntToStr(FLivroFiscalParam.Rg20Incentivos.ItemIndex + 1), {wIncentivo}
                   IntToStr(FLivroFiscalParam.Rg20Movimento.ItemIndex + 1), {wMovimento}
                   IntToStr(FLivroFiscalParam.Rg20SubstitutoTributario.ItemIndex + 1), {wSubsTributario}
                   IntToStr(FLivroFiscalParam.Rg20Escrita.ItemIndex + 1), {wEscrita}
                   FLivroFiscalParam.Me20QtTrabalhadores.Text, {wQtdeTrabalhadores}
                   IntToStr(FLivroFiscalParam.Rg20Creditos.ItemIndex), {wRadioCreditos}
                   IntToStr(FLivroFiscalParam.Rg20Incentivos.ItemIndex)); {wRadioIncentivos}
    //-------------------------------------------------------------
    end;
    if FLivroFiscalParam.RgArquivoSaida.ItemIndex = 0 then
    begin
      With DMLivroFiscal do
      Begin
        wQtLinhas := 0;
        // ---------------  Tipo 90 abaixo --------------\\
        S20 := '20  ';
        S20 := S20 + FormatMaskText('CCCCCCCCCCC',FLivroFiscalParam.Me20CpfContador.Text);
        S20 := S20 + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',FLivroFiscalParam.Me20Contador.Text);
        S20 := S20 + Chr(13)+Chr(10);
        Inc(wQtLinhas,1);
        S21 := '2100';

        wInscricao := DMOracle.BuscaNome('SELECT DESC_INSCRICAO    FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.Fm20Filial.MeFilial.Text));
        wFilial    := DMOracle.BuscaNome('SELECT DESC_FILIAL       FROM TB_FILIAL','COD_FILIAL = '+Trim(FLivroFiscalParam.Fm20Filial.MeFilial.Text));

        // Pega tamanho do Inscricao
        // -------------------------------------------------- \\
        wDesc_Inscricao := Copy(wInscricao,1,1);

        x:=1 ;
        WDesc_Inscricao := '';  // Inicializa valor da variavel
        while x <= Length(wInscricao) do
        begin
          if ( Copy(wInscricao, x, 1) >= '0' ) and
             ( Copy(wInscricao, x, 1) <= '9' ) then
             wDesc_Inscricao := wDesc_Inscricao + Copy(wInscricao,x,1) ;
             Inc(x,1);
        end;
        s21 := S21 + FormatMaskText('CCCCCCCCC',wDesc_Inscricao);
        s21 := s21 + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wFilial);
        s21 := s21 + Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2)+Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20TipoDeclaracao.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20RegimeApuracao.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Porte.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Consolidada.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Centralizada.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Transferencia.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Creditos.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Incentivos.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Movimento.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20SubstitutoTributario.ItemIndex + 1);
        s21 := s21 + IntToStr(FLivroFiscalParam.Rg20Escrita.ItemIndex + 1);
        s21 := s21 + bib.StrZeroDecimal(StrToInt(FLivroFiscalParam.Me20QtTrabalhadores.Text),5,0);
        s21 := s21 + Chr(13)+Chr(10);
        Inc(wQtLinhas,1);

        with DMRegEntrada do
        begin
          QApuracaoE.Close;
          QApuracaoE.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
          QApuracaoE.SetVariable('DATA_I',FLivroFiscalParam.Me20DtInicial.Text);
          QApuracaoE.SetVariable('DATA_F',FLivroFiscalParam.Me20DtFinal.Text);
          QApuracaoE.Open;
          QApuracaoS.Close;
          QApuracaoS.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
          QApuracaoS.SetVariable('DATA_I',FLivroFiscalParam.Me20DtInicial.Text);
          QApuracaoS.SetVariable('DATA_F',FLivroFiscalParam.Me20DtFinal.Text);
          QApuracaoS.Open;
          s22 := '';
          wTotal1 := 0;
          wTotal2 := 0;
          wTotal3 := 0;
          wTotal4 := 0;
          wTotal5 := 0;
          While Not (QApuracaoE.Eof) do
          Begin
            s22 := s22 + '2201';
            s22 := s22 + bib.StrZeroDecimal(QApuracaoENat_Operacao.Value,5,0);
            s22 := s22 + bib.StrZeroDecimal(QApuracaoEVal_Contabil.Value,17,2);
            s22 := s22 + bib.StrZeroDecimal(QApuracaoEVal_Icm_Base.Value,17,2);
            s22 := s22 + bib.StrZeroDecimal(QApuracaoEVal_Icm.Value,17,2);
            s22 := s22 + bib.StrZeroDecimal(QApuracaoEVal_Icm_Base_Isento.Value,17,2);
            s22 := s22 + bib.StrZeroDecimal(QApuracaoEVal_Icm_Base_Outras.Value,17,2);
            s22 := s22 + Chr(13)+Chr(10);
            Inc(wQtLinhas,1);
            wTotal1 := wTotal1 + QApuracaoEVal_Contabil.Value;
            wTotal2 := wTotal2 + QApuracaoEVal_Icm_Base.Value;
            wTotal3 := wTotal3 + QApuracaoEVal_Icm.Value;
            wTotal4 := wTotal4 + QApuracaoEVal_Icm_Base_Isento.Value;
            wTotal5 := wTotal5 + QApuracaoEVal_Icm_Base_Outras.Value;
            QApuracaoE.Next;
          End;
          S24 := '';
          If wTotal1 > 0 Then
           Begin
             s24 := S24 + '2403010' + bib.StrZeroDecimal(wTotal1,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal2 > 0 Then
           Begin
             s24 := S24 + '2403020' + bib.StrZeroDecimal(wTotal2,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal3 > 0 Then
           Begin
             s24 := S24 + '2403030' + bib.StrZeroDecimal(wTotal3,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal4 > 0 Then
           Begin
             s24 := S24 + '2403040' + bib.StrZeroDecimal(wTotal4,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal5 > 0 Then
           Begin
             s24 := S24 + '2403050' + bib.StrZeroDecimal(wTotal5,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;

          s23 := '';
          wTotal1 := 0;
          wTotal2 := 0;
          wTotal3 := 0;
          wTotal4 := 0;
          wTotal5 := 0;
          While Not (QApuracaoS.Eof) do
          Begin
            s23 := s23 + '2302';
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSNat_Operacao.Value,5,0);
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSVal_Contabil.Value,17,2);
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSVal_Icm_Base.Value,17,2);
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSVal_Icm.Value,17,2);
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSVal_Icm_Base_Isento.Value,17,2);
            s23 := s23 + bib.StrZeroDecimal(QApuracaoSVal_Icm_Base_Outras.Value,17,2);
            s23 := s23 + Chr(13)+Chr(10);
            Inc(wQtLinhas,1);
            wTotal1 := wTotal1 + QApuracaoSVal_Contabil.Value;
            wTotal2 := wTotal2 + QApuracaoSVal_Icm_Base.Value;
            wTotal3 := wTotal3 + QApuracaoSVal_Icm.Value;
            wTotal4 := wTotal4 + QApuracaoSVal_Icm_Base_Isento.Value;
            wTotal5 := wTotal5 + QApuracaoSVal_Icm_Base_Outras.Value;
            QApuracaoS.Next;
          End;
          If wTotal1 > 0 Then
           Begin
             s24 := S24 + '2403060' + bib.StrZeroDecimal(wTotal1,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal2 > 0 Then
           Begin
             s24 := S24 + '2403070' + bib.StrZeroDecimal(wTotal2,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal3 > 0 Then
           Begin
             s24 := S24 + '2403080' + bib.StrZeroDecimal(wTotal3,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal4 > 0 Then
           Begin
             s24 := S24 + '2403090' + bib.StrZeroDecimal(wTotal4,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
          If wTotal5 > 0 Then
           Begin
             s24 := S24 + '2403100' + bib.StrZeroDecimal(wTotal5,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
           End;
        end;
        S26 := '';
        wTotalCreditos := 0;
        // Aqui começa o quado 26 foi colocado aqui para ficar em ordem no aquivo - e dentro do mesmo loop vai fazer quadro 25 e 26
        DMLivroFiscal.QResumoApuracao.Close;  // este acesso é paga pegar o saldo credor mes anterior
        DMLivroFiscal.QResumoApuracao.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
        DMLivroFiscal.QResumoApuracao.SetVariable('ANO',Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4));
        DMLivroFiscal.QResumoApuracao.SetVariable('MES',Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2));
        if Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2) = '01' Then
        begin
          DMLivroFiscal.QResumoApuracao.SetVariable('ANO_ANT',StrToInt(Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4))-1);
          DMLivroFiscal.QResumoApuracao.SetVariable('MES_ANT',12);
        end
        Else
        Begin
          DMLivroFiscal.QResumoApuracao.SetVariable('ANO_ANT',StrToInt(Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4)));
          DMLivroFiscal.QResumoApuracao.SetVariable('MES_ANT',StrToInt(Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2))-1);
        End;
        DMLivroFiscal.QResumoApuracao.Open;


        If Not (DMLivroFiscal.QResumoApuracao.Eof) Then
          If DMLivroFiscal.QResumoApuracao.Locate('NUM_GIA',61,[]) Then
           Begin
             S26 := S26 + '2605010' + bib.StrZeroDecimal(DMLivroFiscal.QResumoApuracaoValor.Value,17,2) + Chr(13)+Chr(10);
             Inc(wQtLinhas,1);
             wTotalCreditos := wTotalCreditos + DMLivroFiscal.QResumoApuracaoValor.Value;
           End;

        DMLivroFiscal.QLivroFiscal.Close;
        DMLivroFiscal.QLivroFiscal.SetVariable('Filial',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
        DMLivroFiscal.QLivroFiscal.SetVariable('Ano',Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4));
        DMLivroFiscal.QLivroFiscal.SetVariable('Mes',Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2));
        DMLivroFiscal.QLivroFiscal.Open;
        S25 := '';
        wTotalDebitos := 0;
        If Not(DMLivroFiscal.QLivroFiscal.Eof) Then
         Begin
           S25 := S25 + '2504010' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_DB_ICM.Value,17,2) + Chr(13)+Chr(10);  // debito saida
           S26 := S26 + '2605020' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CR_ICM.Value,17,2) + Chr(13)+Chr(10);  // credito entrada
           Inc(wQtLinhas,2);
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLivroFiscalVAL_CR_ICM.Value;   // esta somando acima
           wTotalDebitos := DMLivroFiscal.QLivroFiscalVAL_DB_ICM.Value;
           DMLivroFiscal.QLcto.Close;  // parametros passados por MasterDetail
           DMLivroFiscal.QLcto.Open;
           While Not (DMLivroFiscal.QLcto.Eof) Do
           Begin
             If DMLivroFiscal.QLctoCod_Gia.Value = 54 Then   // DIFERENCIAL POR ALIQUOTA
             Begin
               S25 := S25 + '2504020' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;
             If DMLivroFiscal.QLctoCod_Gia.Value = 53 Then   // ESTORNO DE CREDITO
             Begin
               S25 := S25 + '2504050' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 56 Then  // OUTROS ESTORNOS
             Begin
               S25 := S25 + '2504060' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 52 Then  // OUTROS DEBITOS
             Begin
               S25 := S25 + '2504070' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 66 Then  // credito ativo permanente
             Begin
               S26 := S26 + '2605030' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 67 Then  // ativo permanente
             Begin
               S26 := S26 + '2605040' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 59 Then  // estorno debitos p/transferencia
             Begin
               S26 := S26 + '2605060' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 64 Then  // outros estornos de debitos
             Begin
               S26 := S26 + '2605070' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             If DMLivroFiscal.QLctoCod_Gia.Value = 63 Then  // outros creditos
             Begin
               S26 := S26 + '2605160' + bib.StrZeroDecimal(DMLivroFiscal.QLctoVAL_IMPOSTO.Value,17,2) + Chr(13)+Chr(10);
               wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
               Inc(wQtLinhas,1);
             End;

             DMLivroFiscal.QLcto.Next;
           End;
           If wTotalDebitos > 0 Then   // total do quadro anterior
           Begin
              S25 := S25 + '2504990' + bib.StrZeroDecimal(wTotalDebitos,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
           End;
           If wTotalCreditos > 0 Then
           Begin
              S26 := S26 + '2605990' + bib.StrZeroDecimal(wTotalCreditos,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
           End;
        End;
        S33 := '';
        If wTotalDebitos > wTotalCreditos Then
         Begin
           S33 := '3312' + DMLivroFiscal.QLivroFiscalInd_Origem.Value + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalCod_Receita.Value,4,0) +
                           FormatDateTime('DDMMYYYY',DMLivroFiscal.QLivroFiscalDt_Vencimento_Recolhimento.Value) + bib.StrZeroDecimal(wTotalDebitos - wTotalCreditos,17,2) +
                           bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalNum_Classe_Vencto.Value,5,0) + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);
         End;

         // aqui começa o preenchimento do quadro 30
        S30 := '';
        S30 := S30 + '3009010' + bib.StrZeroDecimal(wTotalDebitos,17,2) + Chr(13)+Chr(10);
        S30 := S30 + '3009040' + bib.StrZeroDecimal(wTotalDebitos,17,2) + Chr(13)+Chr(10);
        S30 := S30 + '3009050' + bib.StrZeroDecimal(wTotalCreditos,17,2) + Chr(13)+Chr(10);
        Inc(wQtLinhas,3);
        if DMLivroFiscal.QLivroFiscalVal_Credito_Dcip.Value > 0 Then
         Begin
           S30 := S30 + '3009075' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Credito_Dcip.Value,17,2) + Chr(13)+Chr(10);
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLivroFiscalVal_Credito_Dcip.Value;
           Inc(wQtLinhas,1);
         End;
        S30 := S30 + '3009080' + bib.StrZeroDecimal(wTotalCreditos,17,2) + Chr(13)+Chr(10);
        Inc(wQtLinhas,1);
        If wTotalDebitos > wTotalCreditos Then
         Begin
           S30 := S30 + '3009120' + bib.StrZeroDecimal(wTotalDebitos - wTotalCreditos,17,2) + Chr(13)+Chr(10);
           S30 := S30 + '3009999' + bib.StrZeroDecimal(wTotalDebitos - wTotalCreditos,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,2);
         End
        Else
         Begin
           S30 := S30 + '3009140' + bib.StrZeroDecimal(wTotalCreditos - wTotalDebitos,17,2) + Chr(13)+Chr(10);
           S30 := S30 + '3009998' + bib.StrZeroDecimal(wTotalCreditos - wTotalDebitos,17,2) + Chr(13)+Chr(10);
           S30 := S30 + '3009190' + bib.StrZeroDecimal(wTotalCreditos - wTotalDebitos,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,3);
         End;
        If (FLivroFiscalParam.Rg20Creditos.ItemIndex = 0) Or (FLivroFiscalParam.Rg20Incentivos.ItemIndex = 0) Then
         Begin
           S44 := '4444010' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444020' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444030' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Value - DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444130' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_FundoSocial.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444140' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_FundoCultural.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444150' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_FundoTurismo.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444160' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_FundoEsporte.Value,17,2) + Chr(13)+Chr(10);
           S44 := S44 + '4444990' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Value +
                                            DMLivroFiscal.QLivroFiscalVal_FundoSocial.Value +
                                            DMLivroFiscal.QLivroFiscalVal_FundoCultural.Value +
                                            DMLivroFiscal.QLivroFiscalVal_FundoTurismo.Value +
                                            DMLivroFiscal.QLivroFiscalVal_FundoEsporte.Value,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,8);
         End;
        DMLivroFiscal.QRNotaArquivoSc_47.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
        DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
        DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('DATA_I',FLivroFiscalParam.Me20DtInicial.Text);
        DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('DATA_F',FLivroFiscalParam.Me20DtFinal.Text);
        DMLivroFiscal.QRNotaArquivoSc_47.Open;
        S47 := '';
        wTotMunicipio := 0;
        While Not(DMLivroFiscal.QRNotaArquivoSc_47.Eof) Do
         Begin
           S47 := S47 + '4747' + bib.StrZeroDecimal(DMLivroFiscal.QRNotaArquivoSc_47COD_MUNICIPIO_SC.Value,5,0)+
                                 bib.StrZeroDecimal(DMLivroFiscal.QRNotaArquivoSc_47SVAL_TOTAL.Value,17,2)  + Chr(13)+Chr(10);
           wTotMunicipio := wTotMunicipio + DMLivroFiscal.QRNotaArquivoSc_47SVAL_TOTAL.Value;
           DMLivroFiscal.QRNotaArquivoSc_47.Next;
           Inc(wQtLinhas,1);
         End;
        If wTotMunicipio > 0 Then
         Begin
           S47 := S47 + '474799999' + bib.StrZeroDecimal(wTotMunicipio,17,2)  + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);
         End;
        DMRegEntrada.QApuracaoE_UF.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
        DMRegEntrada.QApuracaoE_UF.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
        DMRegEntrada.QApuracaoE_UF.SetVariable('DATA_I',FLivroFiscalParam.Me20DtInicial.Text);
        DMRegEntrada.QApuracaoE_UF.SetVariable('DATA_F',FLivroFiscalParam.Me20DtFinal.Text);
        DMRegEntrada.QApuracaoE_UF.Open;
        S49 := '';
        wTotal1 := 0;
        wTotal2 := 0;
        wTotal3 := 0;
        While Not(DMRegEntrada.QApuracaoE_UF.Eof) Do
         Begin
           S49 := S49 + '4949' + DMRegEntrada.QApuracaoE_UFCOD_ESTADO.Value +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoE_UFVal_Contabil.Value,17,2) +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoE_UFVal_Icm_Base.Value,17,2) +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Isento.Value,17,2) +
                                 '0000000000000000000000000000000000' + Chr(13)+Chr(10);
           wTotal1 := wTotal1 + DMRegEntrada.QApuracaoE_UFVal_Contabil.Value;
           wTotal2 := wTotal2 + DMRegEntrada.QApuracaoE_UFVal_Icm_Base.Value;
           wTotal3 := wtotal3 + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Isento.Value;
           DMRegEntrada.QApuracaoE_UF.Next;
           Inc(wQtLinhas,1);
         End;
        If (wTotal1 <> 0) Or (wTotal2 <> 0) Or (wTotal3 <> 0) Then
         Begin
           S49 := S49 + '4949TT' + bib.StrZeroDecimal(wTotal1,17,2) +
                                 bib.StrZeroDecimal(wTotal2,17,2) +
                                 bib.StrZeroDecimal(wTotal3,17,2) +
                                 '0000000000000000000000000000000000' + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);
         End;
        DMRegEntrada.QApuracaoS_UF.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
        DMRegEntrada.QApuracaoS_UF.SetVariable('FILIAL',FLivroFiscalParam.Fm20Filial.MeFilial.Text);
        DMRegEntrada.QApuracaoS_UF.SetVariable('DATA_I',FLivroFiscalParam.Me20DtInicial.Text);
        DMRegEntrada.QApuracaoS_UF.SetVariable('DATA_F',FLivroFiscalParam.Me20DtFinal.Text);
        DMRegEntrada.QApuracaoS_UF.Open;
        S50 := '';
        wTotal1 := 0;
        wTotal2 := 0;
        wTotal3 := 0;
        While Not(DMRegEntrada.QApuracaoS_UF.Eof) Do
         Begin
           S50 := S50 + '5050' + DMRegEntrada.QApuracaoS_UFCOD_ESTADO.Value +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoS_UFVal_Contabil.Value,17,2) +
                                 '00000000000000000' +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoS_UFVal_Icm_Base.Value,17,2) +
                                 '00000000000000000' +
                                 bib.StrZeroDecimal(DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Isento.Value,17,2) +
                                 '00000000000000000' + Chr(13)+Chr(10);
           wTotal1 := wTotal1 + DMRegEntrada.QApuracaoS_UFVal_Contabil.Value;
           wTotal2 := wTotal2 + DMRegEntrada.QApuracaoS_UFVal_Icm_Base.Value;
           wTotal3 := wtotal3 + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Isento.Value;
           DMRegEntrada.QApuracaoS_UF.Next;
           Inc(wQtLinhas,1);
         End;
        If (wTotal1 <> 0) Or (wTotal2 <> 0) Or (wTotal3 <> 0) Then
         Begin
           S50 := S50 + '5050TT' + bib.StrZeroDecimal(wTotal1,17,2) + '00000000000000000' +
                                 bib.StrZeroDecimal(wTotal2,17,2) + '00000000000000000' +
                                 bib.StrZeroDecimal(wTotal3,17,2) + '00000000000000000' + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);
         End;
        // do registro 80 a 84 somente informar quando mes for 06 (joao passou isso)
        If Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2) = '06' Then
         Begin
           S80 := '8080010' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_ESTOQUE_INICIO.Value,17,2) + Chr(13)+Chr(10);  // ESTOQUE INICIO EXERCICIO
           S80 := S80 + '8080020' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_ESTOQUE_FIM.Value,17,2) + Chr(13)+Chr(10);  // ESTOQUE FIM EXERCICIO
           Inc(wQtLinhas,2);
           S80 := S80 + '8080030' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           Inc(wQtLinhas,1);

           If DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Value > 0 Then
            Begin
              S81 := '8181110' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_DISPONIBILIDADES.Value > 0 Then
            Begin
              S81 := S81 + '8181111' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_DISPONIBILIDADES.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_CIRCULANTE.Value > 0 Then
            Begin
              S81 := S81 + '8181113' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_CIRCULANTE.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_ESTOQUE.Value > 0 Then
            Begin
              S81 := S81 + '8181121' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_ESTOQUE.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTROS_ESTOQUE.Value > 0 then
            Begin
              S81 := S81 + '8181123' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTROS_ESTOQUE.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_ATIVO.Value > 0 Then
            Begin
              S81 := S81 + '8181128' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_ATIVO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Value > 0 Then
            Begin
              S81 := S81 + '8181130' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_REALIZAVEL.Value > 0 Then
            Begin
              S81 := S81 + '8181131' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_REALIZAVEL.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_REALIZAVEL.Value > 0 Then
            Begin
              S81 := S81 + '8181148' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_REALIZAVEL.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Value > 0 Then
            Begin
              S81 := S81 + '8181150' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_INVESTIMENTOS.Value > 0 Then
            Begin
              S81 := S81 + '8181151' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_INVESTIMENTOS.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_IMOBILIZADO.Value > 0 Then
            Begin
              S81 := S81 + '8181155' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_IMOBILIZADO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_DIFERIDO.Value > 0 Then
            Begin
              S81 := S81 + '8181157' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_DIFERIDO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           S81 := S81 + '8181199' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Value + DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Value +
                                            DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Value,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);

           S82 := '8282210' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE_PASSIVO.Value,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);
           If DMLivroFiscal.QLivroFiscalVAL_FORNECEDORES.Value > 0 Then
            Begin
              S82 := S82 + '8282211' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_FORNECEDORES.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_EMPRESTIMOS_FINANCIAMENTOS.Value > 0 Then
            Begin
              S82 := S82 + '8282213' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_EMPRESTIMOS_FINANCIAMENTOS.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PASSIVO.Value > 0 Then
            Begin
              S82 := S82 + '8282215' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PASSIVO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Value > 0 Then
            Begin
              S82 := S82 + '8282230' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Value > 0 Then
            Begin
              S82 := S82 + '8282240' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Value > 0 Then
            Begin
              S82 := S82 + '8282269' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Value > 0 Then
            Begin
              S82 := S82 + '8282270' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_CAPITAL_SOCIAL.Value > 0 Then
            Begin
              S82 := S82 + '8282271' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CAPITAL_SOCIAL.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PATR_LIQUIDO.Value > 0 Then
            Begin
              S82 := S82 + '8282278' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PATR_LIQUIDO.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONT_PATR_LIQ_NEG.Value > 0 Then
            Begin
              S82 := S82 + '8282279' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONT_PATR_LIQ_NEG.Value,17,2) + Chr(13)+Chr(10);
              Inc(wQtLinhas,1);
            End;
           S82 := S82 + '8282299' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE_PASSIVO.Value +
                                            DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Value +
                                            DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Value +
                                            DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Value +
                                            DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Value,17,2) + Chr(13)+Chr(10);
           Inc(wQtLinhas,1);

           S83 := '8383310' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S83 := S83 + '8383311' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value,17,2) + Chr(13)+Chr(10);
           S83 := S83 + '8383320' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value -
                                            DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value,17,2) + Chr(13)+Chr(10);  // receita
           S83 := S83 + '8383323' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Value,17,2) + Chr(13)+Chr(10);  // custo
           wAux := DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value - DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value - DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Value;
           If wAux > 0 Then
            Begin
              S83 := S83 + '8383330' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);  // Lucro bruto
//              S83 := S83 + '8383331' + '00000000000000000' + Chr(13)+Chr(10);
            End
           Else
            Begin
//              S83 := S83 + '8383330' + '00000000000000000' + Chr(13)+Chr(10);  // Lucro bruto
              S83 := S83 + '8383331' + bib.StrZeroDecimal(wAux * -1,17,2) + Chr(13)+Chr(10);   // Prejuizo bruto
            End;
           S83 := S83 + '8383333' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Value,17,2) + Chr(13)+Chr(10);  // custo
           S83 := S83 + '8383335' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Value,17,2) + Chr(13)+Chr(10);  // custo
           wAux := wAux + DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Value - DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Value;
           If wAux > 0 Then
            Begin
              S83 := S83 + '8383340' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);  // lucro operacional
//              S83 := S83 + '8383341' + '00000000000000000' + Chr(13)+Chr(10); // Prejuizo operacional
            End
           Else
            Begin
//              S83 := S83 + '8383340' + '00000000000000000' + Chr(13)+Chr(10);
              S83 := S83 + '8383341' + bib.StrZeroDecimal(wAux * -1,17,2) + Chr(13)+Chr(10);
            End;
           S83 := S83 + '8383343' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Receitas_Nao_Oper.Value,17,2) + Chr(13)+Chr(10);  // custo
           S83 := S83 + '8383345' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Despesas_Nao_Oper.Value,17,2) + Chr(13)+Chr(10);  // custo
           wAux := DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value - DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value -
                   DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Value + DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Value -
                   DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Value + DMLivroFiscal.QLivroFiscalVal_Receitas_Nao_Oper.Value -
                   DMLivroFiscal.QLivroFiscalVal_Despesas_Nao_Oper.Value;
           If wAux > 0 Then
            Begin
              S83 := S83 + '8383350' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);  // lucro operacional
//              S83 := S83 + '8383351' + '00000000000000000' + Chr(13)+Chr(10); // Prejuizo operacional
            End
           Else
            Begin
//              S83 := S83 + '8383350' + '00000000000000000' + Chr(13)+Chr(10);
              S83 := S83 + '8383351' + bib.StrZeroDecimal(wAux * -1,17,2) + Chr(13)+Chr(10);
            End;
           S83 := S83 + '8383353' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Provisao_IR_Contr_Social.Value,17,2) + Chr(13)+Chr(10);  // custo
           wAux := wAux - DMLivroFiscal.QLivroFiscalVal_Provisao_IR_Contr_Social.Value;
           If wAux > 0 Then
            Begin
              S83 := S83 + '8383360' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);  // lucro operacional
//              S83 := S83 + '8383361' + '00000000000000000' + Chr(13)+Chr(10); // Prejuizo operacional
            End
           Else
            Begin
//              S83 := S83 + '8383360' + '00000000000000000' + Chr(13)+Chr(10);
              S83 := S83 + '8383361' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);
            End;
           If DMLivroFiscal.QLivroFiscalVal_Participacoes_Contr.Value > 0 Then
            Begin
              S83 := S83 + '8383363' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Participacoes_Contr.Value,17,2) + Chr(13)+Chr(10);  // custo
              Inc(wQtLinhas);
            End;
           wAux := wAux - DMLivroFiscal.QLivroFiscalVal_Participacoes_Contr .Value;
           If wAux > 0 Then
            Begin
              S83 := S83 + '8383399' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);  // lucro operacional
//              S83 := S83 + '8383398' + '00000000000000000' + Chr(13)+Chr(10); // Prejuizo operacional
            End
           Else
            Begin
//              S83 := S83 + '8383399' + '00000000000000000' + Chr(13)+Chr(10);
              S83 := S83 + '8383398' + bib.StrZeroDecimal(wAux,17,2) + Chr(13)+Chr(10);
            End;
           Inc(wQtLinhas,14);

           S84 := '8484411' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Pro_Labore.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484412' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Comissoes_Salarios.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484431' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Combustiveis.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484421' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Encargos_Sociais.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484422' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Tributos_Federais.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484423' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Tributos_Estaduais.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484424' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Tributos_Municipais.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484432' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Agua_Telefone.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484433' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Energia_Eletrica.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484441' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Alugueis.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484451' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Servicos_Profissionais.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484442' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Seguros.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484443' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Fretes_Carretos.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484461' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Despesas_Financeiras.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484498' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Value,17,2) + Chr(13)+Chr(10);  // valor venda/serviço mes
           S84 := S84 + '8484499' + bib.StrZeroDecimal(DMLivroFiscal.QLivroFiscalVal_Pro_Labore.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Comissoes_Salarios.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Combustiveis.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Encargos_Sociais.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Tributos_Federais.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Tributos_Estaduais.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Tributos_Municipais.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Agua_Telefone.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Energia_Eletrica.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Alugueis.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Servicos_Profissionais.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Seguros.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Fretes_Carretos.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Despesas_Financeiras.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Value +
                                            DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Value,17,2) + Chr(13)+Chr(10);  // TOTAL
           Inc(wQtLinhas,16);
        End;
        S98 := '98  '+ bib.StrZeroDecimal(wQtLinhas,5,0) + Chr(13)+Chr(10);
        Inc(wQtLinhas,2);
        S99 := '99  '+ bib.StrZeroDecimal(wQtLinhas,5,0) + '00001'; // + Chr(13)+Chr(10);
        S := S20 + S21 + S22 + S23 + S24 + S25 + S26 + S30 + S33 + S44 + S47 + S49 + S50 + S80 + S81 + S82 + S83 + S84 + S98 + S99;

        //------------------ Fim --------------------------\\

        If FLivroFiscalParam.SDlgAMagnetico.Execute then
        begin
          AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
          Rewrite(F);
          Writeln(F, S);
          CloseFile(F);
          MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        end
        else
           MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
      end;
    end;
  end;
  end;
procedure TFMenuLivroFiscal.esticulo1Click(Sender: TObject);
begin
  inherited;
  If FRegistro60 = Nil Then
    FRegistro60 := TFRegistro60.Create(Application);
  DMTela.VerificaTela(pModulo,FRegistro60.Caption,FRegistro60.Name);
  FRegistro60.ShowModal;
end;

procedure TFMenuLivroFiscal.LivroFiscalIPI1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalIPICad = Nil Then
    FLivroFiscalIPICad := TFLivroFiscalIPICad.Create(Application);
  DMTela.VerificaTela(pModulo,FLivroFiscalIPICad.Caption,FLivroFiscalIPICad.Name);
  FLivroFiscalIPICad.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivoMagnticoInss1Click(Sender: TObject);
Var  F : TextFile;
begin
  inherited;
  If FRegINSSParam = Nil Then
    FRegINSSParam := TFRegINSSParam.Create(Application);
  FRegINSSParam.PGRelatorio.Pages[1].TabVisible := True;
  if FRegINSSParam.ShowModal = mrok then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text),'LIVRO FISCAL');
     Case FRegINSSParam.Rg1ArquivoGerar.ItemIndex Of
       0 : Proc_Registros_Contabeis;
       1 : Proc_Notas_Fiscais_Emitidas;
       2 : Proc_Itens_Notas_Fiscais_Emitidas;
       3 : Proc_Notas_Fiscais_Terceiros;
       4 : Proc_Itens_Notas_Fiscais_Terceiros;
       5 : Proc_Cadastro;
       6 : Proc_Plano_Conta;
       7 : Proc_Natureza_Operacao;
       8 : Proc_Mercadorias;
     End;

    if FRegINSSParam.SDlgAMagnetico.Execute then
    begin
      AssignFile( F, FRegINSSParam.SDlgAMagnetico.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  end;

end;

procedure TFMenuLivroFiscal.Proc_Registros_Contabeis;
Begin
   with DMRegINSS do
   begin
     QRegContabil.Close;
     If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
       QRegContabil.SetVariable('COD_FILIAL',Null)
     Else
       QRegContabil.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
     QRegContabil.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegContabil.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegContabil.Open;
    End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegContabil.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',DMRegINSS.QRegContabilDt_Lancamento.Value);
      s := s + Bib.AjustaStr(DMRegINSS.QRegContabilNum_Plano_Conta.Text,28);
      s := s + Bib.AjustaStr(wEspacos,28);
      s := s + Bib.AjustaStr(DMRegINSS.QRegContabilNum_Contrapartida.Text,28);
      If DMRegINSS.QRegContabilVal_Lancamento.Value < 0 Then
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegContabilVal_Lancamento.Value * -1,17,2)
      Else
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegContabilVal_Lancamento.Value,17,2);
      s := s + DMRegINSS.QRegContabilInd_Operacao.Value;
      s := s + Bib.AjustaStr(wEspacos,12);
      s := s + Bib.AjustaStr(wEspacos,12);
      s := s + Bib.AjustaStr(DMRegINSS.QRegContabilDesc_Historico_Contabil.Value,150) + chr(13)+chr(10);
      DMRegINSS.QRegContabil.Next;
  end;

  DMRegINSS.QRegSaldoContabil.Close;
  If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
    DMRegINSS.QRegSaldoContabil.SetVariable('COD_FILIAL',Null)
  Else
    DMRegINSS.QRegSaldoContabil.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
  DMRegINSS.QRegSaldoContabil.SetVariable('DT_ANO_MES',Copy(FRegINSSParam.FmDatas1.MeDtInicial.Text,4,2)+Copy(FRegINSSParam.FmDatas1.MeDtInicial.Text,7,4));
  DMRegINSS.QRegSaldoContabil.Open;

  While not DMRegINSS.QRegSaldoContabil.eof do
  Begin
      s := s + FormatDateTime('DDMMYYYY',StrToDate(FRegINSSParam.FmDatas1.MeDtInicial.Text));
      s := s + Bib.AjustaStr(DMRegINSS.QRegSaldoContabilNum_Plano_Conta.Text,28);
      If DMRegINSS.QRegSaldoContabilVal_Anterior.Value < 0 Then
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Anterior.Value * -1,17,2)+'C'
      Else
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Anterior.Value,17,2)+'D';
      s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Debito.Value,17,2);
      s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Credito.Value,17,2);
      If DMRegINSS.QRegSaldoContabilVal_Atual.Value < 0 Then
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Atual.Value * -1,17,2)+'C'
      Else
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Atual.Value,17,2)+'D';
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegSaldoContabil.Next;
  End;

End;

procedure TFMenuLivroFiscal.Proc_Notas_Fiscais_Emitidas;
Begin
  with DMRegINSS do
   begin
     QRegMestreNf_Emitida.Close;
     If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
       QRegMestreNf_Emitida.SetVariable('COD_FILIAL',Null)
     Else
       QRegMestreNf_Emitida.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
     QRegMestreNf_Emitida.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegMestreNf_Emitida.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegMestreNf_Emitida.Open;
    End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegMestreNf_Emitida.eof do
  begin
    With DMRegINSS Do
    Begin
      s := s + QRegMestreNf_EmitidaInd_Entrada_Saida.Value;
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaDesc_Modelo.Value,2);
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaCod_Serie.Value,5);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaNum_Nota.Value,6,0);
      s := s + FormatDateTime('DDMMYYYY',QRegMestreNf_EmitidaDt_Emissao.Value);
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaCod_Cadastro.Text,14);
      s := s + FormatDateTime('DDMMYYYY',QRegMestreNf_EmitidaDt_Recebimento.Value);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Mercadorias.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Desconto.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Frete.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Seguro.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Despesas.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Total_Ipi.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Icms_Subst.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaVal_Mercadorias.Value -
                       QRegMestreNf_EmitidaVal_Desconto.Value +
                       QRegMestreNf_EmitidaVal_Frete.Value +
                       QRegMestreNf_EmitidaVal_Seguro.Value +
                       QRegMestreNf_EmitidaVal_Despesas.Value,17,2);
      s := s + Bib.AjustaStr(wEspacos,14);
      s := s + Bib.AjustaStr('Rodoviário',15);
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaCod_Transportador.Text,14);
      s := s + bib.StrZeroDecimal(1,17,0);
      s := s + Bib.AjustaStr('Caixa',10);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaQt_Bruto.Value,17,3);
      s := s + bib.StrZeroDecimal(QRegMestreNf_EmitidaQt_Liquido.Value,17,3);
      s := s + QRegMestreNf_EmitidaInd_Tipo_Frete.Value;
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaDesc_Placa.Value,15);
      s := s + QRegMestreNf_EmitidaInd_Situacao.Value;
      s := s + QRegMestreNf_EmitidaInd_Tipo_Pagamento.Value;
      s := s + Bib.AjustaStr(QRegMestreNf_EmitidaDesc_Observacao.Value,45);
      s := s + chr(13)+chr(10);
      QRegMestreNf_Emitida.Next;
    End;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Itens_Notas_Fiscais_Emitidas;
Var wCont, wNumero : Integer;
Begin
  with DMRegINSS do
   begin
     QRegItensNf_Emitida.Close;
     If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
       QRegItensNf_Emitida.SetVariable('COD_FILIAL',Null)
     Else
       QRegItensNf_Emitida.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
     QRegItensNf_Emitida.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegItensNf_Emitida.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegItensNf_Emitida.Open;
    End;

  s := '';
  wEspacos := ' ';
  wCont := 0;
  wNumero := DMRegINSS.QRegItensNf_EmitidaNum_Nota.Value;
  while not DMRegINSS.QRegItensNf_Emitida.eof do
  begin
    With DMRegINSS Do
    Begin
      If wNumero <> QRegItensNf_EmitidaNum_Nota.Value Then
         wCont := 0; // serve para colocar a sequencia dos itens na nota fiscal
      Inc(wCont);
      wNumero := DMRegINSS.QRegItensNf_EmitidaNum_Nota.Value;
      s := s + QRegItensNf_EmitidaInd_Entrada_Saida.Value;
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaDesc_Modelo.Value,2);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaCod_Serie.Value,5);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaNum_Nota.Value,6,0);
      s := s + FormatDateTime('DDMMYYYY',QRegItensNf_EmitidaDt_Emissao.Value);
      s := s + bib.StrZeroDecimal(wCont,3,0);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaCod_Produto.Text,20);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaDesc_Complemento.Value,45);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaNat_Operacao.Text,4);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaCod_Operacao.Text,6);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaCod_Nbm_Sh.Text,8);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaQT_Quantidade.Value,17,3);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaDesc_Unidade.Text,3);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Unitario.Value,17,4);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Total.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Desconto.Value,17,2);
      s := s + '3';  // indicador de tributacao do ipi
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaPerc_Ipi.Value,5,2);
      If QRegItensNf_EmitidaPerc_Ipi.Value > 0 Then
         s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Total.Value,17,2)
      Else
         s := s + bib.StrZeroDecimal(0,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Ipi.Value,17,2);
      s := s + Bib.AjustaStr(QRegItensNf_EmitidaDesc_Situacao_Trib.Text,3);
      If (QRegItensNf_EmitidaNum_Classificacao.Value = '0') Or
         (QRegItensNf_EmitidaNum_Classificacao.Value = '1') Or
         (QRegItensNf_EmitidaNum_Classificacao.Value = '2') Or
         (QRegItensNf_EmitidaNum_Classificacao.Value = '3') Then
         s := s + '1'
      Else
        If QRegItensNf_EmitidaNum_Classificacao.Value = '4' Then
           s := s + '2'
        Else
           s := s + '3';
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaPerc_Aliquota.Value,5,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Icm_Base.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Icm.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Base_Subst.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_EmitidaVal_Icms_Subst.Value,17,2);
      s := s + QRegItensNf_EmitidaInd_Estoque.Value;
      s := s + chr(13)+chr(10);
      QRegItensNf_Emitida.Next;
    End;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Notas_Fiscais_Terceiros;
Begin
  with DMRegINSS do
   begin
     QRegMestreNf_Terceiros.Close;
     If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
       QRegMestreNf_Terceiros.SetVariable('COD_FILIAL',Null)
     Else
       QRegMestreNf_Terceiros.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
     QRegMestreNf_Terceiros.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegMestreNf_Terceiros.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegMestreNf_Terceiros.Open;
    End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegMestreNf_Terceiros.eof do
  begin
    With DMRegINSS Do
    Begin
      s := s + Bib.AjustaStr(QRegMestreNf_TerceirosDesc_Modelo.Value,2);
      s := s + Bib.AjustaStr(QRegMestreNf_TerceirosCod_Serie.Value,5);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosNum_Nota.Value,6,0);
      s := s + FormatDateTime('DDMMYYYY',QRegMestreNf_TerceirosDt_Emissao.Value);
      s := s + Bib.AjustaStr(QRegMestreNf_TerceirosCod_Cadastro.Text,14);
      s := s + FormatDateTime('DDMMYYYY',QRegMestreNf_TerceirosDt_Recebimento.Value);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Mercadorias.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Desconto.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Frete.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Seguro.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Despesas.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Total_Ipi.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Icms_Subst.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegMestreNf_TerceirosVal_Mercadorias.Value -
                       QRegMestreNf_TerceirosVal_Desconto.Value +
                       QRegMestreNf_TerceirosVal_Frete.Value +
                       QRegMestreNf_TerceirosVal_Seguro.Value +
                       QRegMestreNf_TerceirosVal_Despesas.Value,17,2);
      s := s + Bib.AjustaStr(wEspacos,14);
      s := s + QRegMestreNf_TerceirosInd_Tipo_Pagamento.Value;
      s := s + Bib.AjustaStr(QRegMestreNf_TerceirosDesc_Observacao.Value,45);
      s := s + chr(13)+chr(10);
      QRegMestreNf_Terceiros.Next;
    End;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Itens_Notas_Fiscais_Terceiros;
Var wCont, wNumero : Integer;
Begin
  with DMRegINSS do
   begin
     QRegItensNf_Terceiros.Close;
     If Trim(FRegINSSParam.FmFilial1Inicial.MeFilial.Text) = '' Then
       QRegItensNf_Terceiros.SetVariable('COD_FILIAL',Null)
     Else
       QRegItensNf_Terceiros.SetVariable('COD_FILIAL',FRegINSSParam.FmFilial1Inicial.MEFilial.Text);
     QRegItensNf_Terceiros.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegItensNf_Terceiros.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegItensNf_Terceiros.Open;
    End;

  s := '';
  wEspacos := ' ';
  wCont := 0;
  wNumero := DMRegINSS.QRegItensNf_TerceirosNum_Nota.Value;
  while not DMRegINSS.QRegItensNf_Terceiros.eof do
  begin
    With DMRegINSS Do
    Begin
      If wNumero <> QRegItensNf_TerceirosNum_Nota.Value Then
         wCont := 0; // serve para colocar a sequencia dos itens na nota fiscal
      Inc(wCont);
      wNumero := DMRegINSS.QRegItensNf_TerceirosNum_Nota.Value;
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosDesc_Modelo.Value,2);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosCod_Serie.Value,5);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosNum_Nota.Value,6,0);
      s := s + FormatDateTime('DDMMYYYY',QRegItensNf_TerceirosDt_Emissao.Value);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosCod_Cadastro.Text,14);
      s := s + bib.StrZeroDecimal(wCont,3,0);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosCod_Produto.Text,20);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosDesc_Complemento.Value,45);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosNat_Operacao.Text,4);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosCod_Operacao.Text,6);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosCod_Nbm_Sh.Text,8);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosQT_Quantidade.Value,17,3);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosDesc_Unidade.Text,3);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Unitario.Value,17,4);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Total.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Desconto.Value,17,2);
      s := s + '3';  // indicador de tributacao do ipi
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosPerc_Ipi.Value,5,2);
      If QRegItensNf_TerceirosPerc_Ipi.Value > 0 Then
         s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Total.Value,17,2)
      Else
         s := s + bib.StrZeroDecimal(0,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Ipi.Value,17,2);
      s := s + Bib.AjustaStr(QRegItensNf_TerceirosDesc_Situacao_Trib.Text,3);
      If (QRegItensNf_TerceirosNum_Classificacao.Value = '0') Or
         (QRegItensNf_TerceirosNum_Classificacao.Value = '1') Or
         (QRegItensNf_TerceirosNum_Classificacao.Value = '2') Or
         (QRegItensNf_TerceirosNum_Classificacao.Value = '3') Then
         s := s + '1'
      Else
        If QRegItensNf_TerceirosNum_Classificacao.Value = '4' Then
           s := s + '2'
        Else
           s := s + '3';
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosPerc_Aliquota.Value,5,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Icm_Base.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Icm.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Base_Subst.Value,17,2);
      s := s + bib.StrZeroDecimal(QRegItensNf_TerceirosVal_Icms_Subst.Value,17,2);
      s := s + QRegItensNf_TerceirosInd_Estoque.Value;
      s := s + chr(13)+chr(10);
      QRegItensNf_Terceiros.Next;
    End;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Cadastro;
Begin
   with DMRegINSS do
   begin
     QRegCadastro_PJ_PF.Close;
     QRegCadastro_PJ_PF.Open;
     QRegCadastro_PJ_PF.First;
   End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegCadastro_PJ_PF.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',DMRegINSS.QRegCadastro_PJ_PFDt_Cadastro.Value);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFCod_Cadastro.Text,14);
      s := s + RMaskCGC_CPF(DMRegINSS.QRegCadastro_PJ_PFNum_Cgc_Cpf.Text,14);
      s := s + Bib.AjustaStr(wEspacos,12);
      If (DMRegINSS.QRegCadastro_PJ_PFNum_Inscricao.Text = 'ISENTO') Or
         (DMRegINSS.QRegCadastro_PJ_PFNum_Inscricao.Text = 'ISENTA') Then
         s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFNum_Inscricao.Text,14)
      Else
         s := s + RMaskCGC_CPF(DMRegINSS.QRegCadastro_PJ_PFNum_Inscricao.Text,14);
      s := s + RMaskCGC_CPF(DMRegINSS.QRegCadastro_PJ_PFDesc_Inscricao_Municipal.Text,14);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFNome.Text,70);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFDesc_Endereco.Text,60);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFDesc_Bairro.Text,20);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFDesc_Cidade.Text,20);
      s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFCod_Estado.Text,2);
      If DMRegINSS.QRegCadastro_PJ_PFDesc_Pais.Text <> 'BRASIL' Then
         s := s + Bib.AjustaStr(DMRegINSS.QRegCadastro_PJ_PFDesc_Pais.Text,20)
      Else
         s := s + Bib.AjustaStr(wEspacos,20);
      s := s + RMaskCGC_CPF(DMRegINSS.QRegCadastro_PJ_PFDesc_Cep.Text,8);
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegCadastro_PJ_PF.Next;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Plano_Conta;
Begin
   with DMRegINSS do
   begin
     QRegPlanoContas.Close;
     QRegPlanoContas.Open;
     QRegPlanoContas.First;
   End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegPlanoContas.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',Date);
      s := s + Bib.AjustaStr(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,28);
      s := s + DMRegINSS.QRegPlanoContasInd_Tipo_Conta.Text;
      If DMRegINSS.QRegPlanoContasInd_Tipo_Conta.Text = 'A' Then
         s := s + Bib.AjustaStr(Copy(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,1,Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) - 6),28)
      Else
         If Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) = 1 Then
            s := s + Bib.AjustaStr(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,28)
         Else
            s := s + Bib.AjustaStr(Copy(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,1,Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) - 2),28);
      s := s + Bib.AjustaStr(DMRegINSS.QRegPlanoContasDesc_Plano_Conta.Text,45);
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegPlanoContas.Next;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Natureza_Operacao;
Begin
   with DMRegINSS do
   begin
     QRegOperacao.Close;
     QRegOperacao.Open;
     QRegOperacao.First;
   End;
  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegOperacao.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',Date);
      s := s + Bib.AjustaStr(DMRegINSS.QRegOperacaoCod_Operacao.Text,6);
      s := s + Bib.AjustaStr(DMRegINSS.QRegOperacaoDesc_Operacao.Text,45);
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegOperacao.Next;
  end;

End;

procedure TFMenuLivroFiscal.Proc_Mercadorias;
Begin
   with DMRegINSS do
   begin
     QRegProdutos.Close;
     QRegProdutos.Open;
     QRegProdutos.First;
   End;
  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegProdutos.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',Date);
      s := s + Bib.AjustaStr(DMRegINSS.QRegProdutosCod_Produto.Text,20);
      s := s + Bib.AjustaStr(DMRegINSS.QRegProdutosDesc_Produto.Text,45);
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegProdutos.Next;
  end;
End;

procedure TFMenuLivroFiscal.EmissoTermosAberturaEncerramento1Click(
  Sender: TObject);
begin
  inherited;
  if FEmissaoTermo = nil then
    FEmissaoTermo := TFEmissaoTermo.Create(Application);
  FEmissaoTermo.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivoMagnticoTipo60Resumo1Click(
  Sender: TObject);
begin
  inherited;
  If FRegistro60ResumoCad = Nil Then
    FRegistro60ResumoCad := TFRegistro60ResumoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRegistro60ResumoCad.Caption,FRegistro60ResumoCad.Name);
  FRegistro60ResumoCad.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivoMagnticoTipo60MestreAnaltico1Click(
  Sender: TObject);
begin
  inherited;
  If FRegistro60MestreCad = Nil Then
    FRegistro60MestreCad := TFRegistro60MestreCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRegistro60MestreCad.Caption,FRegistro60MestreCad.Name);
  FRegistro60MestreCad.ShowModal;
end;

procedure TFMenuLivroFiscal.ParmetrosdePISCOFINS1Click(Sender: TObject);
begin
  inherited;
  If FParamPisCofins = Nil Then
    FParamPisCofins := TFParamPisCofins.Create(Application);
  FParamPisCofins.ShowModal;
end;

procedure TFMenuLivroFiscal.ArquivoMagnticoIntegraoSapiens1Click(
  Sender: TObject);
var
  wstrS : String;
  F : TextFile;
  wData : TDateTime;
Begin
  inherited;
  wstrS := '';
  If FlivroFiscalParam = Nil Then
    FlivroFiscalParam := TFlivroFiscalParam.Create(Application);
  FlivroFiscalParam.PGRelatorio.Pages[27].TabVisible := True;
  If(FlivroFiscalParam.ShowModal = MrOk) Then
  Begin
    With DMLivroFiscal do
    Begin
      QArquivoSapiens.Close;
      DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.Fm28Filial.MeFilial.Text),'LIVRO FISCAL');
      If ( (Trim(FlivroFiscalParam.Fm28Datas.MeDtInicial.Text) = '') OR (Trim(FlivroFiscalParam.Fm28Datas.MeDtFinal.Text) = '') ) Then
        raise Exception.Create('É necessário informar um Período!');
      QArquivoSapiens.SetVariable('DT_INICIO', Trim(FlivroFiscalParam.Fm28Datas.MeDtInicial.Text));
      QArquivoSapiens.SetVariable('DT_FIM', Trim(FlivroFiscalParam.Fm28Datas.MeDtFinal.Text)) ;
      If Trim(FlivroFiscalParam.Me9Filial.Text) <> '' Then
        QArquivoSapiens.SetVariable( 'COD_FILIAL', Trim(FlivroFiscalParam.Fm28Filial.MeFilial.Text) )
      Else
        QArquivoSapiens.SetVariable( 'COD_FILIAL', Null );
      QArquivoSapiens.Open;
      QArquivoSapiens.First;
      If QArquivoSapiens.IsEmpty Then
        raise Exception.Create('Não existem registros a serem gerados no período!');
      //wQbInscricao := QRegEntradaProdPrimarioNUM_NOTA.Text;
      While (not QArquivoSapiens.Eof) Do
      Begin
        If Trim(QArquivoSapiensDESC_PROT_CANCELAMENTO.Text) <> '' Then
         Begin
           If QArquivoSapiensDESC_PROT_CANCELAMENTO.isNull Then
              Showmessage('esta em branco');
           wData := Bib.GetDataCancelamentoNfe(QArquivoSapiensDesc_Chave_Acesso.Value);
           wstrS := wstrS + '09'+'07';
           wstrS := wstrS + Bib.AjustaStr('', 36);
           wstrS := wstrS + QArquivoSapiensDesc_Prot_Cancelamento.Value;
           wstrS := wstrS + FormatDateTime('DD/MM/YYYY',wData);
           wstrS := wstrS + FormatDateTime('HH:mm',wData);
           wstrS := wstrs + bib.StrZeroDecimal(QArquivoSapiensCod_Usuario.Value,6,0);
           wStrs := wstrS + Bib.AjustaStr('', 42) + Chr(13)+Chr(10);
         End
        Else
          If QArquivoSapiensDESC_PROT_AUTORIZACAO.Value <> '' Then
           Begin
             wstrS := wstrS + '01'+'02'+QArquivoSapiensDesc_Prot_Autorizacao.Value;
             wstrS := wstrs + FormatDateTime('DD/MM/YYYY',QArquivoSapiensDt_Autorizacao.Value);
             wstrS := wstrs + FormatDateTime('HH:mm',QArquivoSapiensDt_Autorizacao.Value);
             wstrS := wstrs + bib.StrZeroDecimal(QArquivoSapiensCod_Usuario.Value,6,0);
             wStrs := wstrS + Bib.AjustaStr('', 72) + Chr(13)+Chr(10);
           End
          Else
           Begin
             wstrS := wstrS + '08'+'06';
             wstrS := wstrS + Bib.AjustaStr('', 72);
             wstrS := wstrS + QArquivoSapiensDesc_Prot_Inutilizacao.Value;
             wstrS := wstrS + FormatDateTime('DD/MM/YYYY',QArquivoSapiensDt_Inutilizacao.Value);
             wstrS := wstrS + FormatDateTime('HH:mm',QArquivoSapiensDt_Inutilizacao.Value);
             wstrS := wstrS + bib.StrZeroDecimal(QArquivoSapiensCod_Usuario_Inutilizacao.Value,6,0);
             wStrs := wstrS + Chr(13)+Chr(10);
           End;
        QArquivoSapiens.Next;
      End;
      FLivroFiscalParam.SDlgAMagnetico.FileName := 'Sapiens';
      If FLivroFiscalParam.SDlgAMagnetico.Execute then
       Begin
         AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
         Rewrite(F);
         Writeln(F, wstrS);
         CloseFile(F);
         MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
       End
      Else
         MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
      QArquivoSapiens.Close;
    End;
  End;
end;

procedure TFMenuLivroFiscal.ArquivoMagnticoTipo60Dirio1Click(
  Sender: TObject);
begin
  inherited;
  if FRegistroTipo60DCad = Nil then
    FRegistroTipo60DCad := TFRegistroTipo60DCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRegistroTipo60DCad.Caption,FRegistroTipo60DCad.Name);
  FRegistroTipo60DCad.ShowModal;
end;

procedure TFMenuLivroFiscal.LivroFiscalSaidaICMS1Click(Sender: TObject);
begin
  inherited;
  if FLivroFiscalParam = nil then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[31].TabVisible := True;

  if FLivroFiscalParam.ShowModal = mrOK then
  with DMRegSaida do
   begin
     DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.Me34Filial.Text),'LIVRO FISCAL');
     if Trim(FLivroFiscalParam.Me34Filial.Text) = '' Then
       Raise Exception.Create('Filial não informada!');
     QRegSaidaIcms.Close;
     If Trim(FLivroFiscalParam.Me34NatOperacao.Text) = '' Then
        QRegSaidaIcms.SetVariable('NAT_OPERACAO',Null)
     Else
        QRegSaidaIcms.SetVariable('NAT_OPERACAO',FLivroFiscalParam.Me34NatOperacao.Text);
     QRegSaidaIcms.SetVariable('FILIAL',FLivroFiscalParam.Me34Filial.Text);
     QRegSaidaIcms.SetVariable('DATA_I',FLivroFiscalParam.Me34DtInicial.Text);
     QRegSaidaIcms.SetVariable('DATA_F',FLivroFiscalParam.Me34DtFinal.Text + ' 23:59:59');
     QRegSaidaIcms.Open;

     if FRRegSaidaIcms = nil then
      FRRegSaidaIcms := TFRRegSaidaIcms.Create(Application);
     FRRegSaidaIcms.QRLEmpresa.Caption := 'Empresa: '
      + DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = '
      + Trim(FLivroFiscalParam.Me34Filial.Text));
     if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
       FRRegSaidaIcms.QRPrimario.Preview
     else
       FRRegSaidaIcms.QRPrimario.Print;
   End;
   
  DMRegSaida.QRegSaidaIcms.Close;
end;

End.
