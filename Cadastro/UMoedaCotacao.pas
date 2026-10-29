unit UMoedaCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, DBPanel, ActnList;

type
  TFMoedaCotacao = class(TFTCadSimples)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    MEDataI: TMaskEdit;
    Label6: TLabel;
    Cotao1: TMenuItem;
    DBPanel1: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure MEDataIExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure Cotao1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanel1CodigoExit(Sender: TObject);
    procedure DBPanel1AfterConsulta(Sender: TObject);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMoedaCotacao: TFMoedaCotacao;

implementation

uses UMoeda_cl, UMoedaCons, UOracle_cl, UMoedaParam, URMoeda_Cotacao,
  UMoedaCad, UTela_cl;

{$R *.DFM}

procedure TFMoedaCotacao.FormActivate(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    QMoeda.Open;
    QCotacao.Open;
  end;
end;


procedure TFMoedaCotacao.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMoedaCons = nil then
    FMoedaCons := TFMoedaCons.Create(Application);
  if FMoedaCons.ShowModal = mrOk then
    with DMMoeda do
    begin
      QMoeda.Close;
      QMoeda.SetVariable('PK', QMoedaConsCod_Moeda.Value);
      QMoeda.Open;
    end;
end;

procedure TFMoedaCotacao.MEDataIExit(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    QCotacao.Close;
    QCotacao.SetVariable('DATA_I', StrToDate(MEDataI.Text));
    QCotacao.Open;
  end;
end;

procedure TFMoedaCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    MEDataI.Text := DateToStr(DMOracle.DataServ - 2);
    QCotacao.Close;
    QCotacao.SetVariable('DATA_I', StrToDate(MEDataI.Text));
    QCotacao.Open;
  end;
end;

procedure TFMoedaCotacao.MELocalizaExit(Sender: TObject);
begin
  //inherited;
  with DMMoeda do
  begin
    QMoeda.Close;
    QMoeda.SetVariable('PK', StrToFloat(MELocaliza.Text));
    QMoeda.Open;
  end;
end;

procedure TFMoedaCotacao.Cotao1Click(Sender: TObject);
begin
  inherited;
  if FMoedaParam = nil then
    FMoedaParam := TFMoedaParam.Create(Application);
  FMoedaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FMoedaParam.ShowModal = mrOk then
    with DMMoeda do
    begin
      if Trim(FMoedaParam.FmMoeda1.MeMoeda.Text) = '' then
        raise Exception.Create('Codigo da Moeda não informado!');
      QRCotacao.Close;
      QRCotacao.SetVariable('MOEDA', StrToFloat(Trim(FMoedaParam.FmMoeda1.MeMoeda.Text)));
      QRCotacao.SetVariable('DATA_I', StrToDate(FMoedaParam.ME0DataI.Text));
      QRCotacao.SetVariable('DATA_F', StrToDate(FMoedaParam.ME0DataF.Text));
      QRCotacao.Open;
      if FRMoeda_Cotacao = nil then
        FRMoeda_Cotacao := TFRMoeda_Cotacao.Create(Application);
      FRMoeda_Cotacao.QRPrimario.Preview;
    end;
end;

procedure TFMoedaCotacao.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  MEDataI.Enabled := DSPrimario.DataSet.State = dsBrowse;
end;

procedure TFMoedaCotacao.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFMoedaCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMMoeda do
  begin
    QMoeda.Open;
    QCotacao.Open;
  end;
  Action := CaFree;
  FMoedaCotacao := nil;
end;

procedure TFMoedaCotacao.DBPanel1CodigoExit(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    QCotacao.Close;
    QCotacao.SetVariable('COD_MOEDA', QMoedaCod_Moeda.Value);
    QCotacao.Open;
  end;
end;

procedure TFMoedaCotacao.DBPanel1AfterConsulta(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    QCotacao.Close;
    QCotacao.SetVariable('COD_MOEDA', QMoedaCod_Moeda.Value);
    QCotacao.Open;
  end;
end;

procedure TFMoedaCotacao.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMoedaCons;
  Classe := TFMoedaCons;
end;

end.
