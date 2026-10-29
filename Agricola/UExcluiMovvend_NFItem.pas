unit UExcluiMovvend_NFItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids;

type
  TFExcluiMovVend_NFItem = class(TForm)
    DBGrid1: TDBGrid;
    DSPrimario: TDataSource;
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExcluiMovVend_NFItem: TFExcluiMovVend_NFItem;

implementation

uses UNotaEntrada_cl, UOracle_cl, Ucontrato_cl;

{$R *.DFM}

procedure TFExcluiMovVend_NFItem.Button1Click(Sender: TObject);
begin
  if DSPrimario.DataSet.RecordCount>0 then
    begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.SetVariable('PK',DMNotaEntrada.QContrato_VendMovDeleta_NFItemCOD_CONTRATO_VEND.Value);
        DMContrato.QContrato_Vend.Open;
        If DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value = 'F' Then
           Raise exception.Create('Contrato custo fechado');
        DMContrato.QContrato_Vend.Edit;
        DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value + DMNotaEntrada.QContrato_VendMovDeleta_NFItemQT_QUANTIDADE.Value;
        DMContrato.QMudaStatusItemNF.Close;
        DMContrato.QMudaStatusItemNF.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value);
        DMContrato.QMudaStatusItemNF.SetVariable('STATUS','N');
        DMContrato.QMudaStatusItemNF.ExecSQL;
        DMContrato.QContrato_Vend.Post;
        DSPrimario.DataSet.Delete;
        DMOracle.DBCemapa.Commit;
        DMContrato.QContrato_Vend.Close;
        DMContrato.QContrato_Vend.Open;
      except
        If DMContrato.QContrato_Vend.State In [DsInsert,DsEdit] Then
           DMContrato.QContrato_Vend.Cancel;
        DMOracle.DBCemapa.RollBack;
        Raise;
      end;
    end;
end;
procedure TFExcluiMovVend_NFItem.FormActivate(Sender: TObject);
begin
  DMNotaEntrada.QContrato_VendMovDeleta_NFItem.Open;
end;

procedure TFExcluiMovVend_NFItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMNotaEntrada.QContrato_VendMovDeleta_NFItem.Close;
end;

end.
