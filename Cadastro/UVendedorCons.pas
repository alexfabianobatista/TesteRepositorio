unit UVendedorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, variants,
  Menus, ActnList, ComCtrls;

type
  TFVendedorCons = class(TFTConsulta)
    RgSituacao: TRadioGroup;
    Label7: TLabel;
    EdCidade: TEdit;
    SBCidade: TSpeedButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure proc_consulta_vendedor;
    procedure METextoChange(Sender: TObject);
    procedure EdCidadeChange(Sender: TObject);
    procedure RgSituacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorCons: TFVendedorCons;

implementation

uses UVendedor_cl, UCidadeCons, UCidade_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFVendedorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_vendedor;
end;

procedure TFVendedorCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMVendedor.QVendedorCons;
end;

procedure TFVendedorCons.proc_consulta_vendedor;
begin
   With DMVendedor do
  Begin
    QVendedorCons.Close;
    Case RgSituacao.ItemIndex of
      0 : QVendedorCons.SetVariable('SITUACAO','ATIVO');
      1 : QVendedorCons.SetVariable('SITUACAO','INATIVO');
      2 : QVendedorCons.SetVariable('SITUACAO',Null);
    End;
    QVendedorCons.SetVariable('NOME',Trim('%' + METexto.Text + '%'));
    QVendedorCons.SetVariable('CIDADE', Trim(EdCidade.Text));
    QVendedorCons.Open;
  End;
end;

procedure TFVendedorCons.SBCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    EdCidade.Text := DMCidade.QCidadeConsDesc_Cidade.Value;
end;

procedure TFVendedorCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_vendedor;
end;

procedure TFVendedorCons.EdCidadeChange(Sender: TObject);
begin
  inherited;
  proc_consulta_vendedor;
end;

procedure TFVendedorCons.RgSituacaoClick(Sender: TObject);
begin
  inherited;
  proc_consulta_vendedor;
end;

end.
