unit UGrupoContaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFGrupoContaCons = class(TFTConsulta)
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoContaCons: TFGrupoContaCons;

implementation

uses UGrupoConta_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFGrupoContaCons.FormCreate(Sender: TObject);
var wMask : string;
begin
  inherited;
  //--VERIFICA OS GRAUS CONTÁBEIS PARA APLICAR A MÁSCARA CORRETA------------
  wMask := '';
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
    4: wMask := '#.##.##.######;0;';
    5: wMask := '#.##.##.##.######;0;';
    6: wMask := '#.##.##.##.##.######;0;';
  End;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_DEPRECIACAO.EditMask := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_CIAP.EditMask        := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_DIF_CIAP.EditMask    := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_BAIXA.EditMask       := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_BAIXA_DEP.EditMask   := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_DEPRECIACAO.EditMask  := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_CIAP.EditMask         := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_DIF_CIAP.EditMask     := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_BAIXA.EditMask        := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_BAIXA_DEP.EditMask    := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CREDITO_ICMS.EditMask        := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_DEBITO_ICMS.EditMask         := wMask;
  DMGrupoConta.QGrupoContaConsCONTA_CONTABIL_BEM.EditMask        := wMask;

  //--FIM VERIFICA GRAUS
end;

procedure TFGrupoContaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMGrupoConta.QGrupoContaCons.Close;
  DMGrupoConta.QGrupoContaCons.SetVariable('COD_PATRIMONIO_GRUPO_CONTA', null);
  DMGrupoConta.QGrupoContaCons.SetVariable('DESC_PATRIMONIO_GRUPO_CONTA', METexto.text);
  DMGrupoConta.QGrupoContaCons.open;
end;

end.
