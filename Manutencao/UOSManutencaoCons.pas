unit UOSManutencaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons, variants;

type
  TFOSManutencaoCons = class(TFTConsulta)
    Label2: TLabel;
    MEEquipItem: TEdit;
    MEDt_Emissao_I: TMaskEdit;
    Label3: TLabel;
    METipoServico: TMaskEdit;
    Label4: TLabel;
    BTEquipamentoCons: TBitBtn;
    BTEquipamentoItemCons: TBitBtn;
    BTTipoServicoCons: TBitBtn;
    MENum_OS_Manutencao: TMaskEdit;
    Label5: TLabel;
    MEDt_Emissao_F: TMaskEdit;
    Label6: TLabel;
    MEEquipamento: TMaskEdit;
    procedure BTTipoServicoConsClick(Sender: TObject);
    procedure BTEquipamentoItemConsClick(Sender: TObject);
    procedure BTEquipamentoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSManutencaoCons: TFOSManutencaoCons;

implementation

uses UTipoServicoCons, UTipoServico_cl, UEquipamentoItemCons,
  UEquipamento_cl, UEquipamentoCons, UOSManutencao_cl;

{$R *.DFM}

procedure TFOSManutencaoCons.BTTipoServicoConsClick(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
  begin
    METipoServico.Text := DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;
  end;
end;

procedure TFOSManutencaoCons.BTEquipamentoItemConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoItemCons = Nil then
    FEquipamentoItemCons := TFEquipamentoItemCons.Create(Application);
  If FEquipamentoItemCons.showModal = mrOk then
  begin
    MEEquipItem.Text := DMEquipamento.QEquipamentoItemConsCod_Equipamento_Item.Value;
  end;
end;

procedure TFOSManutencaoCons.BTEquipamentoConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoCons = Nil then
    FEquipamentoCons := TFEquipamentoCons.Create(Application);
  If FEquipamentoCons.showModal = mrOk then
  begin
    METexto.Text := DMEquipamento.QEquipamentoConsCod_Equipamento_Cab.Value;
  end;
end;

procedure TFOSManutencaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOSManutencao do
  Begin
    QOSManutencaoCons.Close;
    If Trim(MENum_OS_Manutencao.Text) = '' then
      QOSManutencaoCons.SetVariable('NUM_OS_MANUTENCAO',Null)
    Else
      QOSManutencaoCons.SetVariable('NUM_OS_MANUTENCAO',trim(MENum_OS_Manutencao.Text));
    If Trim(MEEquipamento.Text) = '' then
      QOSManutencaoCons.SetVariable('COD_EQUIPAMENTO_CAB',Null)
    Else
      QOSManutencaoCons.SetVariable('COD_EQUIPAMENTO_CAB',trim(MEEquipamento.Text));
    If Trim(MEEquipItem.Text) = '' then
      QOSManutencaoCons.SetVariable('COD_EQUIPAMENTO_ITEM',Null)
    Else
      QOSManutencaoCons.SetVariable('COD_EQUIPAMENTO_ITEM',trim(MEEquipItem.Text));
    If Trim(METipoServico.Text) = '' then
      QOSManutencaoCons.SetVariable('COD_TIPO_SERVICO',Null)
    Else
      QOSManutencaoCons.SetVariable('COD_TIPO_SERVICO',Trim(METipoServico.Text));
    If Trim(MEDt_Emissao_I.Text) = '' then
      QOSManutencaoCons.SetVariable('DATA_I',Null)
    Else
      QOSManutencaoCons.SetVariable('DATA_I',Trim(MEDt_Emissao_I.Text));
    If Trim(MEDt_Emissao_F.Text) = '' then
      QOSManutencaoCons.SetVariable('DATA_F',Null)
    Else
      QOSManutencaoCons.SetVariable('DATA_F',Trim(MEDt_Emissao_F.Text));
    QOSManutencaoCons.Open;
  End;
end;

end.
