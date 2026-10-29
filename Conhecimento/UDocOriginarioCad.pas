unit UDocOriginarioCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, uConhecimento_cl, DBPanel, uOracle_cl, DBCtrls;

type
  TFDocOriginarioCad = class(TFTCadSimples)
    DBPChaveAcesso: TDBPanel;
    DBPNumDocumento: TDBPanel;
    DBPCfop: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPTotalNota: TDBPanel;
    DBPTotalProdutos: TDBPanel;
    DBPDataEmissao: TDBPanel;
    DBPSerie: TDBPanel;
    DBCbModelo: TDBComboBox;
    LbModelo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBCbModeloChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDocOriginarioCad: TFDocOriginarioCad;

implementation

uses Math, UParamSistema_cl;

{$R *.dfm}

procedure TFDocOriginarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  /// Adicionado por Djeison - 16/07/2013
  DMOracle.DBCemapa.Commit;
  inherited;
end;
procedure TFDocOriginarioCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBCbModeloChange(Self);
  DMConhecimento.QDocOriginarioDT_EMISSAO.Value := DMOracle.DataServ;   
end;

procedure TFDocOriginarioCad.DBCbModeloChange(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if DBCbModelo.Text = '55' then
    begin
      QDocOriginarioNUM_DOCUMENTO.Required := false;
      QDocOriginarioCOD_SERIE.Required := false;
      QDocOriginarioNUM_CFOP.Required := false;
      QDocOriginarioDT_EMISSAO.Required := false;
      QDocOriginarioDESC_CHAVE_ACESSO.Required := true;
      QDocOriginarioVAL_TOTAL_PRODUTOS.Required := false;
      QDocOriginarioVAL_TOTAL.Required := false;

      DBPNumDocumento.Required := false;
      DBPNumDocumento.Enabled :=  false;
      DBPSerie.Required := false;
      DBPSerie.Enabled :=  false;
      DBPCfop.Required := false;
      DBPCfop.Enabled := false;
      DBPDataEmissao.Required := false;
      DBPDataEmissao.Enabled :=  false;
      DBPChaveAcesso.Required := true;
      DBPChaveAcesso.Enabled :=  true;
      DBPTotalProdutos.Required := false;
      DBPTotalProdutos.Enabled := false;
      DBPTotalNota.Required := false;
      DBPTotalNota.Enabled := false;

      DBPanel4.Enabled := false;
      DBPanel5.Enabled := false;
      DBPanel6.Enabled := false;
      DBPanel7.Enabled := false;
      DBPanel8.Enabled := false;
      DBPChaveAcesso.SetFocus;
    end
    else if (DBCbModelo.Text = '00') or
            (DBCbModelo.Text = '10') or
            (DBCbModelo.Text = '99') then
    begin
      QDocOriginarioNUM_DOCUMENTO.Required := true;
      QDocOriginarioCOD_SERIE.Required := false;
      QDocOriginarioNUM_CFOP.Required := false;
      QDocOriginarioDT_EMISSAO.Required := false;
      QDocOriginarioDESC_CHAVE_ACESSO.Required := false;
      QDocOriginarioVAL_TOTAL_PRODUTOS.Required := false;
      QDocOriginarioVAL_TOTAL.Required := false;

      DBPNumDocumento.Required := true;
      DBPNumDocumento.Enabled := true;
      DBPSerie.Required := false;
      DBPSerie.Enabled := true;
      DBPCfop.Required := false;
      DBPCfop.Enabled := false;
      DBPDataEmissao.Required := false;
      DBPDataEmissao.Enabled := true;
      DBPChaveAcesso.Required := false;
      DBPChaveAcesso.Enabled := false;
      DBPTotalProdutos.Required := false;
      DBPTotalProdutos.Enabled := false;
      DBPTotalNota.Required := false;
      DBPTotalNota.Enabled := true;

      DBPanel4.Enabled := false;
      DBPanel5.Enabled := false;
      DBPanel6.Enabled := false;
      DBPanel7.Enabled := false;
      DBPanel8.Enabled := false;
      DBPNumDocumento.SetFocus;
    end
    else
    begin
      QDocOriginarioNUM_DOCUMENTO.Required := true;
      QDocOriginarioCOD_SERIE.Required := true;
      QDocOriginarioNUM_CFOP.Required := true;
      QDocOriginarioDT_EMISSAO.Required := true;
      QDocOriginarioDESC_CHAVE_ACESSO.Required := false;
      QDocOriginarioVAL_TOTAL_PRODUTOS.Required := true;
      QDocOriginarioVAL_TOTAL.Required := true;

      DBPNumDocumento.Required := true;
      DBPNumDocumento.Enabled := true;
      DBPSerie.Required := true;
      DBPSerie.Enabled := true;
      DBPCfop.Required := true;
      DBPCfop.Enabled := true;
      DBPDataEmissao.Required := true;
      DBPDataEmissao.Enabled := true;
      DBPChaveAcesso.Required := false;
      DBPChaveAcesso.Enabled := false;
      DBPTotalProdutos.Required := true;
      DBPTotalProdutos.Enabled := true;
      DBPTotalNota.Required := true;
      DBPTotalNota.Enabled := true;

      DBPanel4.Enabled := true;
      DBPanel5.Enabled := true;
      DBPanel6.Enabled := true;
      DBPanel7.Enabled := true;
      DBPanel8.Enabled := true;
      DBPNumDocumento.SetFocus;
    end;
  end;
end;

procedure TFDocOriginarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DBCbModeloChange(Self);
end;

end.
