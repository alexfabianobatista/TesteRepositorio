unit UNotaReferenciadaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, uOracle_cl, DBCtrls;

type
  TFNotaRefenciadaCad = class(TFTCadSimples)
    DBPNumDocumento: TDBPanel;
    DBPDataEmissao: TDBPanel;
    DBPSerie: TDBPanel;
    DBCbModelo: TDBComboBox;
    LbModelo: TLabel;
    DBPProdutor: TDBPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPProdutorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaRefenciadaCad: TFNotaRefenciadaCad;

implementation

uses UNotaEntrada_cl, UCadastroCons;

{$R *.dfm}

procedure TFNotaRefenciadaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  /// Adicionado por Djeison - 16/07/2013
  DMOracle.DBCemapa.Commit;
  inherited;
end;
procedure TFNotaRefenciadaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMNotaEntrada.QNotaReferenciadaDT_EMISSAO.Value := DMOracle.DataServ;
end;

procedure TFNotaRefenciadaCad.DBPProdutorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

end.
