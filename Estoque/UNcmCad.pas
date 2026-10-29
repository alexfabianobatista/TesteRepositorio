unit UNcmCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls;

type
  TFNcmCad = class(TFTCadSimples)
    DBDescricao: TDBPanel;
    DBImportado: TDBPanel;
    DBNacional: TDBPanel;
    Label6: TLabel;
    NCM1: TMenuItem;
    DBUMedida: TDBComboBox;
    Label1: TLabel;
    DBGeneroNcm: TDBPanel;
    DBContribuicao: TDBComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    procedure NCM1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBGeneroNcmValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNcmCad: TFNcmCad;

implementation

uses UNcm_cl, UProdutoParam, UProdutoRelatorio_cl, URNcm2, UOracle_cl,
  UNcmCons;

{$R *.dfm}

procedure TFNcmCad.NCM1Click(Sender: TObject);
begin
  inherited;
  if FProdutoParam = nil then
    FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[37].TabVisible := true;
  FProdutoParam.FmProduto37.Visible := false;
  FProdutoParam.CB37Situacao.Visible := false;
  FProdutoParam.Label1.Visible := false;
  FProdutoParam.Label145.Visible := false;
  FProdutoParam.CB37Ordem.Visible := false;
  if FProdutoParam.ShowModal = mrOk then
  begin
    with DMNcm do
    begin
      QRNcm.Close;
      if Trim(FProdutoParam.FmNcm37.MeNcm.Text) <> '' then
        QRNCM.SetVariable('NCM', Trim(FProdutoParam.FmNcm37.MeNcm.Text))
      else
        QRNCM.SetVariable('NCM', null);
      QRNCM.Open;
    end;
    if FRNcm2 = nil then
      FRNcm2 := TFRNcm2.Create(Application);
    if (FProdutoParam.RGPreview.ItemIndex = 0) then
      FRNcm2.QRPrimario.Preview
    else
      FRNcm2.QRPrimario.Print;
  end;
end;
procedure TFNcmCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMNcm do
    QNcm.Open;
end;

procedure TFNcmCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
    DMNcm.QNcm.Open;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
end;

procedure TFNcmCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FNcmCons = Nil then
    FNcmCons := TFNcmCons.Create(Application);
  If FNcmCons.ShowModal = mrOk then
  with DMNcm do
  begin
    QNcm.Close;
    QNcm.SetVariable('PK',QNcmConsCOD_NCM.Value);
    QNcm.Open;
  end;
end;

procedure TFNcmCad.DBGeneroNcmValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
  var str: string;
begin
  inherited;
    str := Value;
  if ((Length(str) = 2) or (Length(str) = 8) or (Length(str) = 7)) then
    isValid := True
  else
  begin
    isValid := False;
    Msg := 'Inválido.';
  end;
end;
end.
