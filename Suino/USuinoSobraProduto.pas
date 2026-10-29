unit USuinoSobraProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel;

type
  TFSuinoSobraProduto = class(TFTCadSimples)
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBPanel3CodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuinoSobraProduto: TFSuinoSobraProduto;

implementation

uses USuino_cl, UCadastroCons, UProdutoCons, USuinoSobraProdutoCons,
  UOracle_cl;

{$R *.dfm}

procedure TFSuinoSobraProduto.FormActivate(Sender: TObject);
begin
  inherited;
  DmSuino.QSobra.Open;
end;

procedure TFSuinoSobraProduto.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFSuinoSobraProduto.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFSuinoSobraProduto.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FSuinoSobraProdutoCons = nil then
    FSuinoSobraProdutoCons := TFSuinoSobraProdutoCons.Create(Application);
  if FSuinoSobraProdutoCons.ShowModal = mrOk then
  begin
    DmSuino.QSobra.Close;
    DmSuino.QSobra.SetVariable('PK', DmSuino.QSobraConsCOD_SUINO_SOBRA_PRODUTO.Value);
    DmSuino.QSobra.Open;
  end;
end;

procedure TFSuinoSobraProduto.DBPanel3CodigoExit(Sender: TObject);
var wTipoProduto: String;
begin
  inherited;
  if ((not (DmSuino.QSobra.State in [dsInsert, dsEdit])) or (DmSuino.QSobraCOD_PRODUTO.IsNull)) then
    Exit;
  wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DmSuino.QSobraCOD_PRODUTO.Text);
  if wTipoProduto <> 'RAÇÃO' then
  begin
    MessageDlg('O produto deve ser do tipo RAÇÃO.', mtError, [mbOK], 0);
    DmSuino.QSobraCOD_PRODUTO.Clear;
    DBPanel3.SetFocus;
  end;
end;

end.
