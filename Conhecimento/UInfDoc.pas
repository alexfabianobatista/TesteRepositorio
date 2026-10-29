unit UInfDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, uOracle_cl, DBCtrls;

type
  TFInfDoc = class(TFTCadSimples)
    DBPChaveAcesso: TDBPanel;
    DBPNumDocumento: TDBPanel;
    DBPDataEmissao: TDBPanel;
    DBPSerie: TDBPanel;
    LbModelo: TLabel;
    DBPSubSerie: TDBPanel;
    CMBTipoDoc: TComboBox;
    DBPValCarga: TDBPanel;
    DBPValNF: TDBPanel;
    DBPCnpjEmit: TDBPanel;
    DBPPinSuframa: TDBPanel;
    DBPEstadoDest: TDBPanel;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBIncluirClick(Sender: TObject);
    procedure CMBTipoDocChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPEstadoDestDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInfDoc: TFInfDoc;

implementation

uses StrUtils, UManifesto_cl, UEstadoCons, UParamSistema_cl, UMdfeCadSimplificado;

{$R *.dfm}

procedure TFInfDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMOracle.DBCemapa.Commit;
  inherited;
end;
procedure TFInfDoc.SBIncluirClick(Sender: TObject);
begin
  inherited;
  CMBTipoDocChange(Self);
end;

procedure TFInfDoc.CMBTipoDocChange(Sender: TObject);
begin
  inherited;
  with DMManifesto do
  begin
    if (LeftStr(CMBTipoDoc.Text,2) = '57') or (LeftStr(CMBTipoDoc.Text,2) = '55') then
    begin
      QInfDocNUM_DOC.Required := false;
      DBPNumDocumento.Required := false;
      DBPNumDocumento.Enabled :=  false;
      QInfDocDESC_SERIE.Required := false;
      DBPSerie.Required := false;
      DBPSerie.Enabled :=  false;
      QInfDocDESC_SUBSERIE.Required := false;
      DBPSubSerie.Enabled := false;
      DBPSubSerie.Enabled :=  false;
      QInfDocDESC_CHAVE_ACESSO.Required := true;
      DBPChaveAcesso.Required := true;
      DBPChaveAcesso.Enabled :=  true;
      QInfDocDT_EMISSAO.Required := false;
      DBPDataEmissao.Required := false;
      DBPDataEmissao.Enabled :=  false;
      QInfDocCOD_UF_DEST.Required := false;
      DBPEstadoDest.Required := false;
      DBPEstadoDest.Enabled :=  false;
      QInfDocDESC_PIN_SUFRAMA.Required := false;
      DBPPinSuframa.Enabled :=  false;
      QInfDocDESC_CNPJ_EMIT.Required := false;
      DBPCnpjEmit.Required := false;
      DBPCnpjEmit.Enabled :=  false;
      QInfDocVAL_CARGA.Required := false;
      DBPValCarga.Required := false;
      DBPValCarga.Enabled :=  false;
      QInfDocVAL_NF.Required := false;
      DBPValNF.Required := false;
      DBPValNF.Enabled :=  false;
      DBPChaveAcesso.DBEdit.SetFocus;
    end
    else if LeftStr(CMBTipoDoc.Text,2) = '01' then
    begin
      QInfDocNUM_DOC.Required := true;
      DBPNumDocumento.Required := true;
      DBPNumDocumento.Enabled :=  true;
      QInfDocDESC_SERIE.Required := true;
      DBPSerie.Required := true;
      DBPSerie.Enabled :=  true;
      QInfDocDESC_SUBSERIE.Required := false;
      DBPSubSerie.Enabled :=  false;
      QInfDocDESC_CHAVE_ACESSO.Required := false;
      DBPChaveAcesso.Required := false;
      DBPChaveAcesso.Enabled :=  false;
      QInfDocDT_EMISSAO.Required := true;
      DBPDataEmissao.Required := true;
      DBPDataEmissao.Enabled :=  true;
      QInfDocCOD_UF_DEST.Required := true;
      DBPEstadoDest.Required := true;
      DBPEstadoDest.Enabled := true;
      QInfDocDESC_PIN_SUFRAMA.Required := true;
      DBPPinSuframa.Enabled :=  true;
      QInfDocDESC_CNPJ_EMIT.Required := true;
      DBPCnpjEmit.Required := true;
      DBPCnpjEmit.Enabled :=  true;
      QInfDocVAL_CARGA.Required := false;
      DBPValCarga.Required := false;
      DBPValCarga.Enabled :=  false;
      QInfDocVAL_NF.Required := true;
      DBPValNF.Required := true;
      DBPValNF.Enabled :=  true;
      DBPNumDocumento.DBEdit.SetFocus;
    end
    else if LeftStr(CMBTipoDoc.Text,2) = '08' then
    begin
      QInfDocNUM_DOC.Required := true;
      DBPNumDocumento.Required := true;
      DBPNumDocumento.Enabled :=  true;
      QInfDocDESC_SERIE.Required := true;
      DBPSerie.Required := true;
      DBPSerie.Enabled :=  true;
      QInfDocDESC_SUBSERIE.Required := true;
      DBPSubSerie.Enabled :=  true;
      QInfDocDESC_CHAVE_ACESSO.Required := false;
      DBPChaveAcesso.Required := false;
      DBPChaveAcesso.Enabled :=  false;
      QInfDocDT_EMISSAO.Required := true;
      DBPDataEmissao.Required := true;
      DBPDataEmissao.Enabled :=  true;
      QInfDocCOD_UF_DEST.Required := false;
      DBPEstadoDest.Required := false;
      DBPEstadoDest.Enabled :=  false;
      QInfDocDESC_PIN_SUFRAMA.Required := false;
      DBPPinSuframa.Enabled :=  false;
      QInfDocDESC_CNPJ_EMIT.Required := false;
      DBPCnpjEmit.Required := false;
      DBPCnpjEmit.Enabled :=  false;
      QInfDocVAL_CARGA.Required := true;
      DBPValCarga.Required := true;
      DBPValCarga.Enabled :=  true;
      QInfDocVAL_NF.Required := false;
      DBPValNF.Required := false;
      DBPValNF.Enabled :=  false;
      DBPNumDocumento.DBEdit.SetFocus;
    end;
  end;
end;

procedure TFInfDoc.SBConfirmarClick(Sender: TObject);
begin
  DMManifesto.QInfDocIND_TIPO_DOC.Value := LeftStr(CMBTipoDoc.Text,2);
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFInfDoc.DBPEstadoDestDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFInfDoc.FormActivate(Sender: TObject);
begin
  inherited;
  CMBTipoDocChange(Self);
end;

procedure TFInfDoc.FormShow(Sender: TObject);
begin
  inherited;
{Solicitado por Joice da Cavalli Contabilidade para que ao emitir um MDFe da filial 8 o modelo dos dados manuais seja 55. cod_suporte: 7122. Alex 18/05/2023}
  if (DMParamSistema.CodEmpresa = 'CONT-ESCRI') and (FMdfeCadSimplificado.DBPFilial.DBEdit.Text = '8') then
    CMBTipoDoc.ItemIndex := 2;
end;

end.
