unit UPauta_Icms_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPauta_Icms_Cons = class(TFTConsulta)
    SbConsProduto: TSpeedButton;
    Label2: TLabel;
    MeEstado: TMaskEdit;
    SbConsEstado: TSpeedButton;
    procedure SbConsEstadoClick(Sender: TObject);
    procedure SbConsProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPauta_Icms_Cons: TFPauta_Icms_Cons;

implementation

uses UPauta_Icms_cl, UEstadoCons, UProdutoCons, UEstado_cl, UProduto_cl;

{$R *.DFM}

procedure TFPauta_Icms_Cons.SbConsEstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons:=TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal=mrOk then
     MeEstado.Text:=DMEstado.QEstadoConsCod_Estado.Value;
end;

procedure TFPauta_Icms_Cons.SbConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk then
     MeTexto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFPauta_Icms_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPauta_ICMS do
   Begin
     QPauta_Icms_Cons.Close;
     If Trim(MeTexto.Text) <> '' Then
        QPauta_Icms_Cons.SetVariable('Cod_Produto',Trim(MeTexto.Text))
     Else
        QPauta_Icms_Cons.SetVariable('Cod_Produto',Null);
     If Trim(MeEstado.Text) <> '' Then
        QPauta_Icms_Cons.SetVariable('Cod_Estado',Trim(MeEstado.Text))
     Else
        QPauta_Icms_Cons.SetVariable('Cod_Estado',Null);
     QPauta_Icms_Cons.Open;
   End;     
end;

end.
