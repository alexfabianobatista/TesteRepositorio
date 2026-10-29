unit UMenuLivroFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Mask, Buttons;

type
  TFMenuLivroFiscal = class(TFTMenuPrincipal)
    Livros1: TMenuItem;
    RegistrodeSadas1: TMenuItem;
    RegistrodeEntradas1: TMenuItem;
    LivroFiscal1: TMenuItem;
    Gia1: TMenuItem;
    GerarArquivomagntico1: TMenuItem;
    N1: TMenuItem;
    RegistrodeINSS1: TMenuItem;
    RegistrodeServiosPrestados1: TMenuItem;
    ArquivodeRegistrodeEntradas1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RegistrodeEntradas1Click(Sender: TObject);
    procedure RegistrodeSadas1Click(Sender: TObject);
    procedure LivroFiscal1Click(Sender: TObject);
    procedure Gia1Click(Sender: TObject);
    procedure GerarArquivomagntico1Click(Sender: TObject);
    procedure RegistrodeINSS1Click(Sender: TObject);
    procedure RegistrodeServiosPrestados1Click(Sender: TObject);
    procedure ArquivodeRegistrodeEntradas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuLivroFiscal: TFMenuLivroFiscal;

implementation

uses URegEntradaParam, URegSaidaParam, UTela_cl, ULivroFiscalCad, UGiaCad,
     ULivroFiscal_Cl, ULivroFiscalParam, UOracle_cl, URegINSS, URegINSS_cl,
  UFilial_cl, URRegINSS, URRegSaida, UBiblioteca, URegServPrestadosParam,
  UUsuario_cl, URegEntrada_cl ;

{$R *.DFM}
{ Função remove mascara cgc/cpf e acrescenta zeros }
function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin

for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

while Length(S) < Zeros do
      S := '0' + S;

Result := S;

end;

{ Função converte espacos em branco/ponto/virgula em zeros }
function StrZero(Num : Real ; Zeros,Deci: integer): string;
var V : String;
    Z : Integer;
begin

  Str(Num:Zeros:Deci, V);
  Trim(V);
  { Convert spaces to zeroes }
  while Pos(' ', V) > 0 do
  begin
    V[Pos(' ', V)] := '0'
  end;

  while ( Pos('.', V) > 0 ) or ( Pos(',', V) > 0 ) do
  begin
    z := Pos('.',V);     // Pega posição
    Delete(V,z,1);      // Deleta na posição.
    Insert('0',V,1);    // Inclui 0 na primeira posicao.
  end;
  Result := V;
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

procedure TFMenuLivroFiscal.GerarArquivomagntico1Click(Sender: TObject);
var
  F : TextFile;
  S, S54,S70, S75, wDesc_Inscricao, wNum_Inscricao, wPAliquota, T90    : String;
  wCgc, wInscricao, wFilial, wCidade, wEstado, wTelefone : String;
  wIPAMagnet, wEndereco, wComplement, wBairro: String;
  wCep, wContato, wNEndereco, wCGC_50, wUF               : String;
  wNumNota,x,wTotalGeral, wNRegistro50,wNRegistro54,wNRegistro70,wNRegistro75 : Integer;
begin
  inherited;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[2].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME3Filial.Text),'LIVRO FISCAL');
    QRLivroFiscalArquivo.Close;
    QRLivroFiscalArquivo_R70.Close;
    QRLivroFiscalArquivo_R75.Close;
    QRLivroFiscalArquivoItens.Close;
    Case FLivroFiscalParam.Rg3TipoNota.ItemIndex Of
      0 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA','E');
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA','E');
       End;
      1 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA','S');
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA','S');
       End;
      2 :
       Begin
        QRLivroFiscalArquivo.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivo_R75.SetVariable('ENTRADA_SAIDA',Null);
        QRLivroFiscalArquivoItens.SetVariable('ENTRADA_SAIDA',Null);
       End;
    End;
    QRLivroFiscalArquivo.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R70.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R70.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo_R75.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivo_R75.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivoItens.SetVariable('DATA_INICIAL',FLivroFiscalParam.ME3DataI.Text);
    QRLivroFiscalArquivoItens.SetVariable('DATA_FINAL',FLivroFiscalParam.ME3DataF.Text);
    QRLivroFiscalArquivo.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R70.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo_R75.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivoItens.SetVariable('COD_FILIAL',FLivroFiscalParam.ME3Filial.Text);
    QRLivroFiscalArquivo.Open;
    QRLivroFiscalArquivo.First;

    wCgc       := DMOracle.BuscaNome('SELECT NUM_CGC           FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wInscricao := DMOracle.BuscaNome('SELECT DESC_INSCRICAO    FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wFilial    := DMOracle.BuscaNome('SELECT DESC_FILIAL       FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wCidade    := DMOracle.BuscaNome('SELECT DESC_CIDADE       FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wEstado    := DMOracle.BuscaNome('SELECT COD_ESTADO        FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wTelefone  := DMOracle.BuscaNome('SELECT DESC_TELEFONE     FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wIPAMagnet := DMOracle.BuscaNome('SELECT IND_PADRAO_ARQ_MAGNETICO FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wEndereco  := DMOracle.BuscaNome('SELECT DESC_ENDERECO     FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wNEndereco := DMOracle.BuscaNome('SELECT NUM_ENDERECO      FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wComplement:= DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_ENDERECO FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wBairro    := DMOracle.BuscaNome('SELECT DESC_BAIRRO       FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wCep       := DMOracle.BuscaNome('SELECT DESC_CEP          FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));
    wContato   := DMOracle.BuscaNome('SELECT DESC_NOME_CONTATO FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRLivroFiscalArquivoCOD_FILIAL.Value));

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
    '1'                                                               +  // FormatMaskText('CC',wIPAMagnet)
    Copy(wIPAMagnet,2,1)                                              +
    Copy(FLivroFiscalParam.Rg3TipoArquivo.Items[FLivroFiscalParam.Rg3TipoArquivo.ItemIndex],1,1) +
    Chr(13)+Chr(10);
    // ---------------  Tipo 11 abaixo --------------\\
    S := S + '11'                                                     +  { Tipo }
    FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',wEndereco)    +
    StrZero(StrToInt(wNEndereco),5,0)                                           +
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

    While not QRLivroFiscalArquivo.Eof do
    begin
      wNRegistro50 := wNRegistro50 + 1 ;
      if QRLivroFiscalArquivoPERC_ALIQUOTA.Value = 0 then
         wPAliquota := '0000'
      else
         wPaliquota := StrZero(QRLivroFiscalArquivoPERC_ALIQUOTA.Value,2,0) + '00';
      wNum_Inscricao := Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,1,1);
      if ( wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) or
         ( DMLivroFiscal.QRLivroFiscalArquivoIND_FISICA_JURIDICA.Value = 'F' ) then
           wNum_Inscricao := UpperCase('ISENTO       ')
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
      end;
      // Verifica se cadastro é pessoa fisica
      if QRLivroFiscalArquivoIND_FISICA_JURIDICA.Value = 'F' then
         wCGC_50 := '00000000000000'
      else
         wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoNUM_CGC_CPF.Value,14);
      If Trim(QRLivroFiscalArquivoUF_CLIENTE.Value) = 'PY' Then
         wUf := 'EX'
      Else
         wUf := QRLivroFiscalArquivoUF_CLIENTE.Value;
      if Trim(QRLivroFiscalArquivoIND_SITUACAO.Value) <> '3' then  // não é uma nota cancelada.
      begin
        S:= S + '50'                                                           + { Tipo }
        wCGC_50                                                                +
        FormatMaskText('CCCCCCCCCCCCCC',Trim(wNum_Inscricao))                  +
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,7,4)        +  {Ano}
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,4,2)        +  {Mes}
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,1,2)        +  {Dia}
        wUF                                                                    +
        '01'                                                                   +  { Modelo da nota???}
        FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value)+
        '  '                                                                   + { Sub-serie da NFiscal }
        StrZero(QRLivroFiscalArquivoNUM_NOTA.Value,6,0)          +
        StrZero(QRLivroFiscalArquivoNAT_OPERACAO.value,3,0)      + { Classificação Fiscal de Operação }
        StrZero(QRLivroFiscalArquivoVAL_TOTAL.Value,13,2)        +
        StrZero(QRLivroFiscalArquivoVAL_ICM_BASE.Value,13,2)     +
        StrZero(QRLivroFiscalArquivoVAL_ICM.Value,13,2)          +
        StrZero(QRLivroFiscalArquivoVAL_BASE_ISENTA.Value,13,2)  +
        StrZero(QRLivroFiscalArquivoVAL_BASE_OUTRAS.value,13,2)  +
        wPAliquota                                                             +
        Trim(QRLivroFiscalArquivoSITUACAO.Value)+Chr(13)+Chr(10);
      end
      else    // É uma nota fiscal cancelada. Tratamento especial.
      begin
        S:= S + '50'                                                           + { Tipo }
        wCGC_50                                                                +
        FormatMaskText('CCCCCCCCCCCCCC',wNum_Inscricao)                        +
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,7,4)        +  {Ano}
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,4,2)        +  {Mes}
        Copy(QRLivroFiscalArquivoDT_RECEBIMENTO.Text,1,2)        +  {Dia}
        wUF                                                                    +
        '01'                                                                   + { Modelo da nota }
        FormatMaskText('CCC',QRLivroFiscalArquivoCOD_SERIE.Value)+ { Serie na nota }
        '  '                                                                   + { Sub-serie da NFiscal }
        StrZero(QRLivroFiscalArquivoNUM_NOTA.Value,6,0)          + { Numero da nota fiscal }
        StrZero(QRLivroFiscalArquivoNAT_OPERACAO.value,3,0)      + { Classificação Fiscal de Operação }
        '0000000000000'                                                        + { Valor total da nota }
        '0000000000000'                                                        + { Base de calculo do ICMS }
        '0000000000000'                                                        + { Valor do ICMS }
        '0000000000000'                                                        + { Isenta ou não tributada }
        '0000000000000'                                                        + { Outras }
        '0000'                                                                 + { Aliquota ICMS }
        'S'+Chr(13)+Chr(10)             {Situação e fim do registro.}
      end;
      QRLivroFiscalArquivo.Next;  // Pula para proximo registro.
    end;
    QRLivroFiscalArquivoItens.Open;
    wNumNota := 0;
    x := 0;
    while not QRLivroFiscalArquivoItens.Eof do
    begin
      If wNumNota <> QRLivroFiscalArquivoItensNUM_NOTA.Value Then
         x := 0;  // serve para controlar o numero do item na nota fiscal
      wNumNota := QRLivroFiscalArquivoItensNUM_NOTA.Value;
      Inc(x);
      Inc(wNRegistro54);
      if QRLivroFiscalArquivoItensIND_FISICA_JURIDICA.Value = 'F' then
         wCGC_50 := '00000000000000'
      else
         wCGC_50 := RMaskCGC_CPF(QRLivroFiscalArquivoItensNUM_CGC_CPF.Value,14);
      if QRLivroFiscalArquivoItensPERC_ALIQUOTA.Value = 0 then
         wPAliquota := '0000'
      else
         wPaliquota := StrZero(QRLivroFiscalArquivoItensPERC_ALIQUOTA.Value,2,0) + '00';
      s54 := s54 + '54'                                                        +
      wCGC_50                                                                  +
      '01'                                                                     +  { Modelo da nota???}
      FormatMaskText('CCC',QRLivroFiscalArquivoItensCOD_SERIE.Value)           +
      '  '                                                                     + { Sub-serie da NFiscal }
      StrZero(QRLivroFiscalArquivoItensNUM_NOTA.Value,6,0)                     +
      StrZero(QRLivroFiscalArquivoItensNAT_OPERACAO.value,3,0)                 + { Classificação Fiscal de Operação }
      StrZero(x,3,0)                                                           +
      FormatMaskText('CCCCCCCCCCCCCC',FloatToStr(QRLivroFiscalArquivoItensCOD_PRODUTO.Value))+
      StrZero(QRLivroFiscalArquivoItensQT_QUANTIDADE.Value,13,3)               +
      StrZero(QRLivroFiscalArquivoItensVAL_TOTAL.Value,12,2)                   +
      StrZero(QRLivroFiscalArquivoItensVAL_DESCONTO.Value,12,2)                +
      StrZero(QRLivroFiscalArquivoItensVAL_ICM_Base.Value,12,2)                +
      '000000000000000000000000'                                               +
      wPAliquota+Chr(13)+Chr(10);
      QRLivroFiscalArquivoItens.Next;
    end;

    QRLivroFiscalArquivo_R75.Open;
    QRLivroFiscalArquivo_R75.First;
    // ---------------  Tipo 75 abaixo --------------\\
    while not QRLivroFiscalArquivo_R75.Eof do
    begin
      Inc(wNRegistro75);
      S75 := S75 + '75'                                                 +
      Copy(FLivroFiscalParam.ME3DataI.Text,7,4)                         +
      Copy(FLivroFiscalParam.ME3DataI.Text,4,2)                         +
      Copy(FLivroFiscalParam.ME3DataI.Text,1,2)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,7,4)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,4,2)                         +
      Copy(FLivroFiscalParam.ME3DataF.Text,1,2)                         +
      FormatMaskText('CCCCCCCCCCCCCC',FloatToStr(QRLivroFiscalArquivo_R75COD_PRODUTO.Value))+
      '        '                                                        +
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
      If ( wNum_Inscricao = 'I' ) or ( Trim(wNum_Inscricao) = '' ) or
         ( DMLivroFiscal.QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA.Value = 'F' ) then
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
      If QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA.Value = 'F' then
         wCGC_50 := '00000000000000'
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
      '07U'                                                                   +  { Modelo da nota???}
//      FormatMaskText('C',DMLivroFiscal.QRLivroFiscalArquivoCOD_SERIE.Value)  +
      '  '                                                                   + { Sub-serie da NFiscal }
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70NUM_CONHECIMENTO.Value,6,0)      +
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70NAT_OPERACAO.value,3,0)  + { Classificação Fiscal de Operação }
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70VAL_TOTAL.Value,14,2)    +
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70VAL_ICM_BASE.Value,14,2)     +
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70VAL_ICM.Value,14,2)          +
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70VAL_BASE_ISENTO.Value,14,2)  +
      StrZero(DMLivroFiscal.QRLivroFiscalArquivo_R70VAL_BASE_OUTRAS.value,14,2)  +
      '1'                                                                    +
      Trim(DMLivroFiscal.QRLivroFiscalArquivo_R70SITUACAO.Value)+Chr(13)+Chr(10);
      QRLivroFiscalArquivo_R70.Next;
    end;

    // ---------------  Tipo 90 abaixo --------------\\

    // 2 = Tipo10 + Tipo11 -  wNRegistro50 = Soma tipo 50  -  1 = Tipo90
    S := S + S54 + S70 + S75;
    wTotalGeral := 2 + wNRegistro50 + wNRegistro54 + wNRegistro70 + wNRegistro75 + 1 ;

    T90 := '90'                                          +
    RMaskCGC_CPF(wCgc,14)                                +
    FormatMaskText('CCCCCCCCCCCCCC',wDesc_Inscricao)     +
    '50'                                                 +  // Tipo de registro a ser totalizado.
    RMaskCGC_CPF(IntToStr(wNRegistro50),8)               +
    '54'                                                 +  // Tipo de registro a ser totalizado.
    RMaskCGC_CPF(IntToStr(wNRegistro54),8)               +
    '70'                                                 +  // Tipo de registro a ser totalizado.
    RMaskCGC_CPF(IntToStr(wNRegistro70),8)               +
    '75'                                                 +  // Tipo de registro a ser totalizado.
    RMaskCGC_CPF(IntToStr(wNRegistro75),8)               +
    '99'+RMaskCGC_CPF(IntToStr(wTotalGeral),8)           ;

    // Este procedimento é necessario para o tamanho da string S ficar igual a 126.
    while Length(T90) <= 124 do
          T90 := T90 + ' ';

    S := S + T90 + '1'; // + Chr(13)+Chr(10) ;
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
  wstrS, wstrSinal:String;
  F : TextFile;
begin
  inherited;
  wstrS := '';
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
      wstrS := '001'                                                                                    +
      RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioDESC_INSCRICAO.Text), 10 )                              +
      Chr(13)+Chr(10);

      While (not QRegEntradaProdPrimario.Eof) Do
      Begin
        If QRegEntradaProdPrimarioIND_COMPRAS.Text = 'D' then
          wstrSinal := '-'
        Else
          wstrSinal := ' ';

        wstrS := wstrS + Bib.FormataTexto( Trim(QRegEntradaProdPrimarioNUM_CGC_CPF.Text), 14 )         +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_CIDADE.Text), 5 )                                +
        FormatDateTime( 'DDMMYYYY', QRegEntradaProdPrimarioDT_EMISSAO.Value)                           +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioNUM_NOTA.Text), 6 );
        If Trim(QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text) = 'F' Then
          wstrS := wstrS + RMaskCGC_CPF('0', 14);
        If Trim(QRegEntradaProdPrimarioIND_FIXAR_EMPRESA.Text) = 'E' Then
          wstrS := wstrS + RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioPESO.Text), 14 );
        wstrS := wstrS + wstrSinal                                                                     +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioCOD_PRODUTO.Text), 5 )                               +
        RMaskCGC_CPF( Trim(QRegEntradaProdPrimarioVAL_TOTAL.Text), 13 )                                +
        wstrSinal                                                                                      +
        '000000'                                                                                       +
        Chr(13)+Chr(10);
        QRegEntradaProdPrimario.Next;
      End;
    End;
    If wstrS <> '' Then
    Begin
      if FLivroFiscalParam.SDlgAMagnetico.Execute then
      begin
        AssignFile( F, FLivroFiscalParam.SDlgAMagnetico.FileName );
        Rewrite(F);
        Writeln(F, wstrS);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
      end
      else
         MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    End;
    DMRegEntrada.QRegEntradaProdPrimario.Close;
  End;
end;

end.
