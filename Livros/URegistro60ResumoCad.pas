unit URegistro60ResumoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRegistro60ResumoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label47: TLabel;
    DBEdit54: TDBEdit;
    BtConsProduto: TBitBtn;
    DBDirceu1: TDBDirceu;
    Opes1: TMenuItem;
    ImportardasNotas1: TMenuItem;
    Rateiodevalores1: TMenuItem;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ImportardasNotas1Click(Sender: TObject);
    procedure Rateiodevalores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistro60ResumoCad: TFRegistro60ResumoCad;

implementation

uses ULivroFiscal_Cl, UProduto_cl, URegistro60ResumoCons, UProdutoCons,
  ULivroFiscalParam, UOracle_cl;

{$R *.dfm}

procedure TFRegistro60ResumoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFRegistro60ResumoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QTipo60Resumo.Open;
end;

procedure TFRegistro60ResumoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRegistro60ResumoCons = Nil then
    FRegistro60ResumoCons := TFRegistro60ResumoCons.Create(Application);
  If FRegistro60ResumoCons.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    QTipo60Resumo.Close;
    QTipo60Resumo.SetVariable('PK', QTipo60ResumoConsCOD_REGISTRO_RESUMO.Value);
    QTipo60Resumo.Open;
  End;
end;

procedure TFRegistro60ResumoCad.ImportardasNotas1Click(Sender: TObject);
var
wItens, wMes, wAno : string;
begin
  inherited;
  if FLivroFiscalParam = nil then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[23].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrOK then
  Begin
    If Trim(FLivroFiscalParam.FmFilial23.MeFilial.Text) = '' then
      Raise Exception.Create('Informe a Filial!');
//    If Trim(FLivroFiscalParam.FmOperacao23.MeOperacao.Text) = '' then
//      Raise Exception.Create('Informe a Operação!');
    If Trim(FLivroFiscalParam.FmDatas23.MeDtInicial.Text) = '' then
      Raise Exception.Create('Informe a Data!');
    If Trim(FLivroFiscalParam.FmDatas23.MeDtFinal.Text) = '' then
      Raise Exception.Create('Informe a Data!');
    if Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,4,7) <> Copy(FLivroFiscalParam.FmDatas23.MeDtInicial.Text,4,7) then
      Raise Exception.Create('Só é possível importar notas do mesmo mês e do mesmo ano!');

    wMes := Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,4,2);
    if Copy(wMes,1,1) = '0' then
      wMes := Copy(wMes,2,1);
    wAno := Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,7,4);
    wItens := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_REGISTRO_TIPO60_RESUMO','NUM_MES ='+Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,4,2)+' AND NUM_ANO = '+Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,7,4));
    if wItens <> '0' then
    Begin
      DMLivroFiscal.QDeletaResumoTipo60.Close;
      DMLivroFiscal.QDeletaResumoTipo60.SetVariable('MES',wMes);
      DMLivroFiscal.QDeletaResumoTipo60.SetVariable('ANO',wAno);
      DMLivroFiscal.QDeletaResumoTipo60.Open;
      while not DMLivroFiscal.QDeletaResumoTipo60.Eof do
        DMLivroFiscal.QDeletaResumoTipo60.Delete;
      DMOracle.DBCemapa.Commit;
    end;

    DMLivroFiscal.QImportaNotas_Resumo60.Close;
    DMLivroFiscal.QImportaNotas_Resumo60.SetVariable('COD_FILIAL',FLivroFiscalParam.FmFilial23.MeFilial.Text);
//    DMLivroFiscal.QImportaNotas_Resumo60.SetVariable('COD_OPERACAO',FLivroFiscalParam.FmOperacao23.MeOperacao.Text);
    DMLivroFiscal.QImportaNotas_Resumo60.SetVariable('DT_EMISSAO_I',FLivroFiscalParam.FmDatas23.MeDtInicial.Text);
    DMLivroFiscal.QImportaNotas_Resumo60.SetVariable('DT_EMISSAO_F',FLivroFiscalParam.FmDatas23.MeDtFinal.Text);
    DMLivroFiscal.QImportaNotas_Resumo60.Open;
    DMLivroFiscal.QTipo60Resumo.Close;
    DMLivroFiscal.QTipo60Resumo.Open;
    while not DMLivroFiscal.QImportaNotas_Resumo60.Eof do
    Begin
      DMLivroFiscal.QTipo60Resumo.Insert;
      DMLivroFiscal.QTipo60ResumoNUM_MES.Value := StrToInt(Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,4,2));
      DMLivroFiscal.QTipo60ResumoNUM_ANO.Value := StrToInt(Copy(FLivroFiscalParam.FmDatas23.MeDtFinal.Text,7,4));
      DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Value := DMLivroFiscal.QImportaNotas_Resumo60COD_PRODUTO.Text;
      DMLivroFiscal.QTipo60ResumoQT_QUANTIDADE.Value := DMLivroFiscal.QImportaNotas_Resumo60QT_QUANTIDADE.Value;
      DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value := DMLivroFiscal.QImportaNotas_Resumo60VAL_TOTAL.Value;
      DMLivroFiscal.QTipo60ResumoVAL_BASE_ICMS.Value := DMLivroFiscal.QImportaNotas_Resumo60VAL_ICM_BASE.Value;
      DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value := DMLivroFiscal.QImportaNotas_Resumo60COD_TRIB_IMP_FISCAL.Value;
      DMLivroFiscal.QTipo60ResumoPERC_ALIQUOTA.Value := DMLivroFiscal.QImportaNotas_Resumo60PERC_ALIQUOTA.Value;
      DMLivroFiscal.QTipo60Resumo.Post;
      DMLivroFiscal.QImportaNotas_Resumo60.Next;
    end;
  end;
end;

procedure TFRegistro60ResumoCad.Rateiodevalores1Click(Sender: TObject);
Var wValor : Real;
Begin
  inherited;
  DMLivroFiscal.QMestreAnalitico.Close;
  DMLivroFiscal.QMestreAnalitico.Open;
  DMLivroFiscal.QTipo60Resumo.Close;
  DMLivroFiscal.QTipo60Resumo.Open;
  While not(DMLivroFiscal.QMestreAnalitico.Eof) Do
   Begin
      DMLivroFiscal.QTipo60Resumo.Insert;
      DMLivroFiscal.QTipo60ResumoNUM_MES.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoMes.Value);
      DMLivroFiscal.QTipo60ResumoNUM_ANO.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoAno.Value);
      DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Value   := '5';
      DMLivroFiscal.QTipo60ResumoQT_QUANTIDADE.Value := DMLivroFiscal.QMestreAnaliticoVal_Mensal.Value * 0.65 / 2.15;
      DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value   := DMLivroFiscal.QMestreAnaliticoVal_Mensal.Value * 0.65;
      DMLivroFiscal.QTipo60ResumoVAL_BASE_ICMS.Value := 0;
      DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value := 'F';
      DMLivroFiscal.QTipo60ResumoPERC_ALIQUOTA.Value := 0;
      DMLivroFiscal.QTipo60Resumo.Post;
      wValor := DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value;

      DMLivroFiscal.QTipo60Resumo.Insert;
      DMLivroFiscal.QTipo60ResumoNUM_MES.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoMes.Value);
      DMLivroFiscal.QTipo60ResumoNUM_ANO.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoAno.Value);
      DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Value   := '3';
      DMLivroFiscal.QTipo60ResumoQT_QUANTIDADE.Value := DMLivroFiscal.QMestreAnaliticoVal_Mensal.Value * 0.25 / 2.60;
      DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value   := DMLivroFiscal.QMestreAnaliticoVal_Mensal.Value * 0.25;
      DMLivroFiscal.QTipo60ResumoVAL_BASE_ICMS.Value := 0;
      DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value := 'F';
      DMLivroFiscal.QTipo60ResumoPERC_ALIQUOTA.Value := 0;
      DMLivroFiscal.QTipo60Resumo.Post;
      wValor := wValor + DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value;

      wValor := DMLivroFiscal.QMestreAnaliticoVal_Mensal.Value - wValor;
      DMLivroFiscal.QTipo60Resumo.Insert;
      DMLivroFiscal.QTipo60ResumoNUM_MES.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoMes.Value);
      DMLivroFiscal.QTipo60ResumoNUM_ANO.Value := StrToInt(DMLivroFiscal.QMestreAnaliticoAno.Value);
      DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Value   := '4';
      DMLivroFiscal.QTipo60ResumoQT_QUANTIDADE.Value := wValor / 1.50;
      DMLivroFiscal.QTipo60ResumoVAL_PRODUTO.Value   := wValor;
      DMLivroFiscal.QTipo60ResumoVAL_BASE_ICMS.Value := 0;
      DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value := 'F';
      DMLivroFiscal.QTipo60ResumoPERC_ALIQUOTA.Value := 0;
      DMLivroFiscal.QTipo60Resumo.Post;

      DMLivroFiscal.QMestreAnalitico.Next;

   End;
  DMLivroFiscal.QTipo60Resumo.Close;
  DMLivroFiscal.QMestreAnalitico.Close;
End;

end.
