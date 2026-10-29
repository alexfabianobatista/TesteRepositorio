unit USuinoDespesaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel;

type
  TFSuinoDespesaCad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuinoDespesaCad: TFSuinoDespesaCad;

implementation

uses USuino_cl, UCadastroCons, UHistoricoCons, USuinoDespesaCons,
  USuinoParam;

{$R *.dfm}

procedure TFSuinoDespesaCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFSuinoDespesaCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFSuinoDespesaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DmSuino.QSuinoDespesa.Open;
end;

procedure TFSuinoDespesaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FSuinoDespesaCons = nil then
    FSuinoDespesaCons := TFSuinoDespesaCons.Create(Application);
  if FSuinoDespesaCons.ShowModal = mrOk then
  begin
    DmSuino.QSuinoDespesa.Close;
    DmSuino.QSuinoDespesa.SetVariable('PK', DmSuino.QSuinoDespesaConsCOD_SUINO_DESPESA.Value);
    DmSuino.QSuinoDespesa.Open;
  end;
end;

procedure TFSuinoDespesaCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  if FSuinoParam = nil then
    FSuinoParam := TFSuinoParam.Create(Application);
  if FSuinoParam.ShowModal = mrOK then
  begin
  end;
end;

end.
