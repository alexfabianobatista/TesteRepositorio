unit URegistro60MestreCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRegistro60MestreCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    GbEquipamento: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DsAnalitico: TDataSource;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    RelatrioECFPerodo1: TMenuItem;
    Operao1: TMenuItem;
    CadastrarreduoZ1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioECFPerodo1Click(Sender: TObject);
    procedure CadastrarreduoZ1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistro60MestreCad: TFRegistro60MestreCad;

implementation

uses ULivroFiscal_Cl, URegistro60MestreCons, UOracle_cl, ULivroFiscalParam,
  UREcf_Periodo, UReducaoZCad, UImpressoraFiscal_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFRegistro60MestreCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QTipo60Mestre.Open;
  DMLivroFiscal.QTipo60Analitico.Open;
end;

procedure TFRegistro60MestreCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRegistro60MestreCons = Nil then
    FRegistro60MestreCons := TFRegistro60MestreCons.Create(Application);
  If FRegistro60MestreCons.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    QTipo60Mestre.Close;
    QTipo60Mestre.SetVariable('PK', QTipo60MestreConsCOD_REGISTRO_MESTRE.Value);
    QTipo60Mestre.Open;
  End;
end;

procedure TFRegistro60MestreCad.RelatrioECFPerodo1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[25].TabVisible := True;
  If FLivroFiscalParam.ShowModal = MrOk then
    with DMLivroFiscal do
    begin
      QREcfPeriodo.Close;
      QREcfPeriodo.SetVariable('DT_EMISSAO_INI', FLivroFiscalParam.FmDatas26.MeDtInicial.Text);
      QREcfPeriodo.SetVariable('DT_EMISSAO_FIN', FLivroFiscalParam.FmDatas26.MEDtFinal.Text);

      QREcfPeriodo.Open;
      If FREcf_Periodo = nil then
         FREcf_Periodo := TFREcf_Periodo.Create(Application);

      FREcf_Periodo.QRLTitulo.Caption := 'ECF por Período de ' + FLivroFiscalParam.FmDatas26.MeDtInicial.Text + ' até ' + FLivroFiscalParam.FmDatas26.MEDtFinal.Text;
      If FLivroFiscalParam.RGPreview.ItemIndex = 0 then
         FREcf_Periodo.QRPrimario.Preview
      else
         FREcf_Periodo.QRPrimario.Print;
      QREcfPeriodo.Close;
    End;
End;

procedure TFRegistro60MestreCad.CadastrarreduoZ1Click(Sender: TObject);
var
  arq: TextFile;
begin
  inherited;
  if FReducaoZCad = Nil then
    FReducaoZCad := TFReducaoZCad.Create(Application);
  if FReducaoZCad.ShowModal = MrOk then
  begin
    with DMImpressoraFiscal, DMLivroFiscal do
    begin
      DeleteFile(FImpressoraFiscal.PathBematech+'CopiaReducao.txt');
      AssignFile(arq,FImpressoraFiscal.PathBematech+'CopiaReducao.txt');
      Rewrite(arq);
      Writeln(arq, QReducaoZConsDESC_ARQUIVO.value);
      CloseFile(arq);
      DeleteFile(FImpressoraFiscal.PathBematech+'DadosReducao.txt');
      AssignFile(arq,FImpressoraFiscal.PathBematech+'DadosReducao.txt');
      Rewrite(arq);
      Writeln(arq, QReducaoZConsDESC_DADOS_REDUCAO.value);
      CloseFile(arq);
      try
        FImpressoraFiscal.LeArquivoTexto(
        FImpressoraFiscal.PathBematech+'CopiaReducao.txt',3,true,
        FImpressoraFiscal.PathBematech+'DadosReducao.txt');
        MessageDlg('Operação realizada com sucesso', mtInformation,
          [mbOk],0);
      Except

      end;
    end;
  end;
end;

end.
