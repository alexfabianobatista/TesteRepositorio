unit UNotaCorrecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, ActnList;

type
  TFNotaCorrecao = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBECodCorrecao: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    CartadeCorreo1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEEspecificacao: TDBEdit;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CartadeCorreo1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBECodCorrecaoChange(Sender: TObject);
  private
    { Private declarations }
{    fNota : Integer;
    fConhecimento : Integer;
}  public
    { Public declarations }
  end;

var
  FNotaCorrecao: TFNotaCorrecao;

implementation

uses UNotaSaida_cl, UNotaSaidaCons, UNotaEntrada_cl, URNotaCorrecao,
  UNotaCorrecao_cl, UParamSistema_cl, UOracle_cl;

{$R *.DFM}

procedure TFNotaCorrecao.FormActivate(Sender: TObject);
begin
//  inherited;
  With DMNotaCorrecao do
  Begin
    QNotaCorrecao.Close;
    QNotaCorrecao.SetVariable( 'COD_NOTA_CAB',DMNotaCorrecao.pCodNota);
    //conhecimento frete
    if DMNotaCorrecao.pCodConhecimentoFrete <> 0 then
      QNotaCorrecao.SetVariable( 'COD_CONHECIMENTO',DMNotaCorrecao.pCodConhecimentoFrete)
    else  //conhecimento
      QNotaCorrecao.SetVariable( 'COD_CONHECIMENTO',DMNotaCorrecao.pCodConhecimento);
    QNotaCorrecao.Open;
  End;
end;

procedure TFNotaCorrecao.CartadeCorreo1Click(Sender: TObject);
var wSql1, wSql2 : string;
begin
  inherited;
  If FRNotaCorrecao = Nil Then
    FRNotaCorrecao := TFRNotaCorrecao.Create(Application);
  With DMNotaCorrecao do
  Begin
    //carta correcao nota
    If (pCodConhecimento = 0) and (pCodConhecimentoFrete = 0) then
    Begin
      QRNotaCorrecao.Close;
      QRNotaCorrecao.SQL.Clear;
      QRNotaCorrecao.SQL.Add('SELECT');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NOME AS DESC_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_ENDERECO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_BAIRRO AS DESC_ENDERECO_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_CIDADE || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.COD_ESTADO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_CEP AS DESC_CIDADE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_CGC_CPF AS DESC_CNPJ_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CAB.IND_ENTRADA_SAIDA AS DESC_TIPO_NF,');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CAB.DT_EMISSAO AS DT_EMISSAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CAB.NUM_NOTA AS NUM_NF, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CAB.COD_SERIE AS DESC_SERIE,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.NUM_CGC AS Desc_Cnpj_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_FILIAL AS Desc_Nome_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_ENDERECO Desc_Endereco_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_CIDADE ||' + chr(39) + ', '  + chr(39) + '|| TB_FILIAL.COD_ESTADO AS Desc_cidade, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_BAIRRO ||' + chr(39) + ' - ' + chr(39) + '|| TB_FILIAL.DESC_CEP AS Desc_Bairro_Cep_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DESC_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DT_CARTA_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.Desc_Origem_Nota');
      QRNotaCorrecao.SQL.Add('FROM ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CAB, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO');
      QRNotaCorrecao.SQL.Add('WHERE ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO AND ');
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = 1')
      Else
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL');
      QRNotaCorrecao.SQL.ADD(  'AND TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_CORRECAO.COD_NOTA_CAB ');
      QRNotaCorrecao.SQL.Add(  'AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(DMNotaCorrecao.pCodNota) );
      QRNotaCorrecao.SQL.ADD(  'AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = 0');
      QRNotaCorrecao.SQL.ADD('ORDER BY ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO');


      //---especificação para codigos de correcao 34, 35, 36--------------
      wSql1 := 'SELECT TB_NOTA_CORRECAO.DESC_ESPECIFICACAO FROM TB_CADASTRO, TB_NOTA_CAB, TB_FILIAL, TB_NOTA_CORRECAO ';

      wSql2 := '';
      wSql2 := wSql2 + ' TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO AND ';
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = 1 ' Else
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL ';
      wSql2 := wSql2 + ' AND TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_CORRECAO.COD_NOTA_CAB ';
      wSql2 := wSql2 + ' AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(DMNotaCorrecao.pCodNota);
      wSql2 := wSql2 + ' AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = 0 ';

      FRNotaCorrecao.QRLEsp34.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 34 ');

      FRNotaCorrecao.QRLEsp35.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 35 ');

      FRNotaCorrecao.QRLEsp36.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 36 ');
      //--------------fim
    End
    //carta correcação conhecimento
    Else if DMNotaCorrecao.pCodConhecimento <> 0 then
    Begin
      QRNotaCorrecao.Close;
      QRNotaCorrecao.SQL.Clear;
      QRNotaCorrecao.SQL.Add('SELECT ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NOME AS DESC_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_ENDERECO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_BAIRRO AS DESC_ENDERECO_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_CIDADE || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.COD_ESTADO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_CEP AS DESC_CIDADE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_CGC_CPF AS DESC_CNPJ_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO,' + Chr(39) + '' + Chr(39) + ' AS DESC_TIPO_NF,');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO.DT_EMISSAO AS DT_EMISSAO, ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO.NUM_CONHECIMENTO AS NUM_NF, ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO.COD_SERIE AS DESC_SERIE,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.NUM_CGC AS Desc_Cnpj_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_FILIAL AS Desc_Nome_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_ENDERECO Desc_Endereco_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_CIDADE ||' +chr(39)+ ', ' +chr(39)+ '|| TB_FILIAL.COD_ESTADO AS Desc_cidade, TB_FILIAL.DESC_BAIRRO ||' +chr(39)+ ' - ' +chr(39)+ '|| TB_FILIAL.DESC_CEP AS Desc_Bairro_Cep_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DESC_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DT_CARTA_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.Desc_Origem_Nota ');
      QRNotaCorrecao.SQL.Add('FROM ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL, ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO');
      QRNotaCorrecao.SQL.Add('WHERE ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO.COD_CADASTRO AND ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO.COD_CONHECIMENTO = TB_NOTA_CORRECAO.COD_CONHECIMENTO AND ');
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = 1')
      Else
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = TB_CONHECIMENTO.COD_FILIAL');
      QRNotaCorrecao.SQL.ADD(  'AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = ' + IntToStr(DMNotaCorrecao.pCodConhecimento) );
      QRNotaCorrecao.SQL.ADD('ORDER BY ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO');


      //---ESPECIFICAÇÃO PARA CODIGOS DE CORRECAO 34, 35, 36--------------
      wSql1 := 'SELECT TB_NOTA_CORRECAO.DESC_ESPECIFICACAO FROM TB_CADASTRO, TB_FILIAL, TB_CONHECIMENTO, TB_NOTA_CORRECAO ';

      wSql2 := '';
      wSql2 := wSql2 + ' TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO.COD_CADASTRO AND ';
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = 1 ' Else
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = TB_CONHECIMENTO.COD_FILIAL ';
      wSql2 := wSql2 + 'AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = ' + IntToStr(DMNotaCorrecao.pCodConhecimento);

      FRNotaCorrecao.QRLEsp34.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 34 ');

      FRNotaCorrecao.QRLEsp35.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 35 ');

      FRNotaCorrecao.QRLEsp36.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 36 ');
      //--------------FIM--------------------

    End
    //ConhecimentoFrete
    Else if DMNotaCorrecao.pCodConhecimentoFrete <> 0 then
    Begin
      QRNotaCorrecao.Close;
      QRNotaCorrecao.SQL.Clear;
      QRNotaCorrecao.SQL.Add('SELECT ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NOME AS DESC_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_ENDERECO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_BAIRRO AS DESC_ENDERECO_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.DESC_CIDADE || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.COD_ESTADO || ' +chr(39)+ ' - ' +chr(39)+ '|| TB_CADASTRO.DESC_CEP AS DESC_CIDADE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_CGC_CPF AS DESC_CNPJ_CADASTRO,TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO,');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.NUM_INSCRICAO AS DESC_IE_CADASTRO,' + Chr(39) + '' + Chr(39) + ' AS DESC_TIPO_NF,');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO_FRETE.DT_EMISSAO_CONHECIMENTO AS DT_EMISSAO,');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO_FRETE.NUM_FRETE AS NUM_NF,' + Chr(39) + '   ' + Chr(39) + 'AS DESC_SERIE,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.NUM_CGC AS Desc_Cnpj_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_FILIAL AS Desc_Nome_Filial, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_ENDERECO Desc_Endereco_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_CIDADE ||' +chr(39)+ ', ' +chr(39)+ '|| TB_FILIAL.COD_ESTADO AS Desc_cidade, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL.DESC_BAIRRO ||' +chr(39)+ ' - ' +chr(39)+ '|| TB_FILIAL.DESC_CEP AS Desc_Bairro_Cep_Filial,');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DESC_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.DT_CARTA_CORRECAO, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.Desc_Origem_Nota ');
      QRNotaCorrecao.SQL.Add('FROM');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO, ');
      QRNotaCorrecao.SQL.Add('  TB_FILIAL, ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO_FRETE, ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO');
      QRNotaCorrecao.SQL.Add('WHERE ');
      QRNotaCorrecao.SQL.Add('  TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO_FRETE.COD_CADASTRO AND ');
      QRNotaCorrecao.SQL.Add('  TB_CONHECIMENTO_FRETE.COD_CONHECIMENTO_FRETE = TB_NOTA_CORRECAO.COD_CONHECIMENTO AND ');
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = 1')
      Else
        QRNotaCorrecao.SQL.Add('TB_FILIAL.COD_FILIAL = TB_CONHECIMENTO_FRETE.COD_FILIAL');
      QRNotaCorrecao.SQL.ADD(  'AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = ' + IntToStr(DMNotaCorrecao.pCodConhecimentoFrete) );
      QRNotaCorrecao.SQL.ADD('ORDER BY ');
      QRNotaCorrecao.SQL.Add('  TB_NOTA_CORRECAO.COD_CORRECAO');


      //---ESPECIFICAÇÃO PARA CODIGOS DE CORRECAO 34, 35, 36--------------
      wSql1 := 'SELECT TB_NOTA_CORRECAO.DESC_ESPECIFICACAO FROM TB_CADASTRO, TB_FILIAL, TB_CONHECIMENTO_FRETE, TB_NOTA_CORRECAO ';

      wSql2 := '';
      wSql2 := wSql2 + ' TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO_FRETE.COD_CADASTRO AND ';
      wSql2 := wSql2 + '  TB_CONHECIMENTO_FRETE.COD_CONHECIMENTO_FRETE = TB_NOTA_CORRECAO.COD_CONHECIMENTO AND ';
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = 1 ' Else
      wSql2 := wSql2 + ' TB_FILIAL.COD_FILIAL = TB_CONHECIMENTO_FRETE.COD_FILIAL ';
      wSql2 := wSql2 + 'AND TB_NOTA_CORRECAO.COD_CONHECIMENTO = ' + IntToStr(DMNotaCorrecao.pCodConhecimentoFrete);

      FRNotaCorrecao.QRLEsp34.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 34 ');

      FRNotaCorrecao.QRLEsp35.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 35 ');

      FRNotaCorrecao.QRLEsp36.Caption
        := DMOracle.BuscaNome(wSql1, wSql2 + ' AND TB_NOTA_CORRECAO.COD_CORRECAO = 36 ');
      //--------------FIM--------------------


    End;
    QRNotaCorrecao.Open;
  End;
  FRNotaCorrecao.QRPrimario.Preview;
end;

procedure TFNotaCorrecao.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(67);

end;

procedure TFNotaCorrecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMNotaCorrecao.QNotaCorrecao.Close;
end;

procedure TFNotaCorrecao.DBECodCorrecaoChange(Sender: TObject);
begin
  inherited;
  if (trim(DBECodCorrecao.Text) = '34') or
     (trim(DBECodCorrecao.Text) = '35') or
     (trim(DBECodCorrecao.Text) = '36') then
  begin
    DBEEspecificacao.ReadOnly := false;
    DBEEspecificacao.TabStop  := true;
    DBEEspecificacao.Color    := clWindow;
  end
  else
  begin
    DBEEspecificacao.ReadOnly := true;
    DBEEspecificacao.TabStop  := false;
    DBEEspecificacao.Color    := clBtnFace;
  end;
end;

end.
