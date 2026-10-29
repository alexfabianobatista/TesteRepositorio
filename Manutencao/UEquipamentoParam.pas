unit UEquipamentoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFEquipamentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    ME1CodEquipamento: TMaskEdit;
    ME1CodItemEquipamento: TMaskEdit;
    ED1DescEquipamento: TEdit;
    BitBtn6: TBitBtn;
    ED1DescItemEquipamento: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure ME1CodEquipamentoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ME1CodItemEquipamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoParam: TFEquipamentoParam;

implementation

uses UEquipamentoCons, UEquipamento_cl, UEquipamentoItemCons, UOracle_cl;

{$R *.DFM}

procedure TFEquipamentoParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FEquipamentoCons = Nil then
    FEquipamentoCons := TFEquipamentoCons.Create(Application);
  If FEquipamentoCons.ShowModal = mrOk then
  Begin
    ME1CodEquipamento.Text := DMEquipamento.QEquipamentoConsCod_Equipamento_Cab.Text;
    ME1CodEquipamentoExit(Self);
  End;
end;

procedure TFEquipamentoParam.ME1CodEquipamentoExit(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  Begin
    if Trim(ME1CodEquipamento.Text) <> '' Then
      Ed1DescEquipamento.Text := DMOracle.BuscaNome('SELECT TB_EQUIPAMENTO_CAB.DESC_EQUIPAMENTO FROM TB_EQUIPAMENTO_CAB ',' COD_EQUIPAMENTO_CAB = '+CHR(39)+Trim(ME1CodEquipamento.Text)+CHR(39))
    else
      Ed1DescEquipamento.Text := 'Todos';
  end;
end;

procedure TFEquipamentoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FEquipamentoItemCons = Nil then
    FEquipamentoItemCons := TFEquipamentoItemCons.Create(Application);
  If FEquipamentoItemCons.ShowModal = mrOk then
  Begin
    ME1CodItemEquipamento.Text := DMEquipamento.QEquipamentoItemConsCod_Equipamento_Item.Text;
    ME1CodItemEquipamentoExit(Self);
  End;
end;

procedure TFEquipamentoParam.ME1CodItemEquipamentoExit(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  begin
    If Trim(ME1CodItemEquipamento.Text) <> '' Then
      Ed1DescItemEquipamento.Text := DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO_ITEM FROM TB_EQUIPAMENTO_ITEM ','COD_EQUIPAMENTO_ITEM = '+CHR(39)+Trim(ME1CodItemEquipamento.Text)+CHR(39))
    else
      Ed1DescItemEquipamento.Text := 'Todos';
  end;
end;

end.
