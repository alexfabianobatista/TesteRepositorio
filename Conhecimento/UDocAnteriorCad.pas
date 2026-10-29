unit UDocAnteriorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, uConhecimento_cl, DBPanel, uOracle_cl, DBCtrls;

type
  TFDocAnteriorCad = class(TFTCadSimples)
    DBPChaveAcesso: TDBPanel;
    DBPNumDocumento: TDBPanel;
    DBPDataEmissao: TDBPanel;
    DBPSerie: TDBPanel;
    LbModelo: TLabel;
    DBPSubSerie: TDBPanel;
    CMBTipoDoc: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBIncluirClick(Sender: TObject);
    procedure CMBTipoDocChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDocAnteriorCad: TFDocAnteriorCad;

implementation

uses StrUtils;

{$R *.dfm}

procedure TFDocAnteriorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMOracle.DBCemapa.Commit;
  inherited;
end;
procedure TFDocAnteriorCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBPNumDocumento.SetFocus;
end;

procedure TFDocAnteriorCad.CMBTipoDocChange(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if LeftStr(CMBTipoDoc.Text,2) = '57' then
    begin
      QDocAnteriorNUM_DOCUMENTO.Required := false;
      QDocAnteriorCOD_SERIE.Required := false;
      QDocAnteriorCOD_SUB_SERIE.Required := false;
      QDocAnteriorDT_EMISSAO.Required := false;
      QDocAnteriorDESC_CHAVE_ACESSO.Required := true;

      DBPNumDocumento.Required := false;
      DBPNumDocumento.Enabled := false;
      DBPSerie.Required := false;
      DBPSerie.Enabled := false;
      DBPSubSerie.Required := false;
      DBPSubSerie.Enabled := false;
      DBPDataEmissao.Required := false;
      DBPDataEmissao.Enabled := false;
      DBPChaveAcesso.Required := true;
      DBPChaveAcesso.Enabled :=  true;
    end
    else
    begin
      QDocAnteriorNUM_DOCUMENTO.Required := true;
      QDocAnteriorCOD_SERIE.Required := true;
      QDocAnteriorCOD_SUB_SERIE.Required := true;
      QDocAnteriorDT_EMISSAO.Required := true;
      QDocAnteriorDESC_CHAVE_ACESSO.Required := false;

      DBPNumDocumento.Required := true;
      DBPNumDocumento.Enabled := true;
      DBPSerie.Required := true;
      DBPSerie.Enabled := true;
      DBPSubSerie.Required := true;
      DBPSubSerie.Enabled := true;
      DBPDataEmissao.Required := true;
      DBPDataEmissao.Enabled := true;
      DBPChaveAcesso.Required := false;
      DBPChaveAcesso.Enabled :=  false;
    end;
  end;
end;

procedure TFDocAnteriorCad.SBConfirmarClick(Sender: TObject);
begin
  DMConhecimento.QDocAnteriorIND_TP_DOC.Value := LeftStr(CMBTipoDoc.Text,2);
  inherited;     
  DMOracle.DBCemapa.Commit;
end;

procedure TFDocAnteriorCad.FormActivate(Sender: TObject);
begin
  inherited;
  CMBTipoDocChange(Self);
end;

end.
