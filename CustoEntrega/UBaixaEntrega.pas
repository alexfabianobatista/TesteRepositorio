unit UBaixaEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFBaixaEntrega = class(TFTConsulta)
    SBBaixar: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBBaixarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaEntrega: TFBaixaEntrega;

implementation

uses UCustoEntrega_cl, UOracle_cl;

{$R *.DFM}

procedure TFBaixaEntrega.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCustoEntrega do
    Begin
      QBaixaEntrega.Close;
      QBaixaEntrega.Open;
    end;
end;

procedure TFBaixaEntrega.SBBaixarClick(Sender: TObject);
begin
  inherited;
  if DMCustoEntrega.QBaixaEntregaIND_SITUACAO.Value = 'PENDENTE' then
    Begin
      DMCustoEntrega.QBaixaEntrega.Edit;
      DMCustoEntrega.QBaixaEntregaIND_SITUACAO.Value := 'TRANSITO';
      DMCustoEntrega.QBaixaEntregaDT_BAIXA.Value := DMOracle.Dataserv;
      DMCustoEntrega.QBaixaEntrega.Post;
      DMCustoEntrega.QBaixaEntrega.Close;
      DMCustoEntrega.QBaixaEntrega.Open;
    end
  Else
    Begin
      DMCustoEntrega.QBaixaEntrega.Edit;
      DMCustoEntrega.QBaixaEntregaIND_SITUACAO.Value := 'ENTREGUE';
      DMCustoEntrega.QBaixaEntregaDT_BAIXA.Value := DMOracle.Dataserv;
      DMCustoEntrega.QBaixaEntrega.Post;
      DMCustoEntrega.QBaixaEntrega.Close;
      DMCustoEntrega.QBaixaEntrega.Open;
    end;
end;

end.
