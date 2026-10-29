unit UOSManutencaoEncerramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFOSManutencaoEncerramento = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BTEquipamentoCons: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    BitBtn3: TBitBtn;
    procedure BTEquipamentoConsClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSManutencaoEncerramento: TFOSManutencaoEncerramento;

implementation

uses UOSManutencao_cl, UAtividadeCons, UFFuncionarioCons, UAtividade_cl,
  UFuncionario_cl, UOracle_cl;

{$R *.DFM}

procedure TFOSManutencaoEncerramento.BTEquipamentoConsClick(
  Sender: TObject);
begin
  If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.showModal = mrOk then
    DMOSManutencao.QOSManutencaoMovCod_Atividade_cab.Value := DMAtividade.QAtividadeConsCod_Atividade_cab.Value;
end;

procedure TFOSManutencaoEncerramento.BitBtn2Click(Sender: TObject);
begin
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
    DMOSManutencao.QOSManutencaoMovCod_Funcionario.Value := DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
end;

procedure TFOSManutencaoEncerramento.BitBtn1Click(Sender: TObject);
begin
  with DMOSManutencao do
  Begin
    QOSManutencao.edit;
    QOSManutencaoDt_Encerramento.Value := date;
    QOSManutencao.post;

    if (QOSManutencaoDt_Prevista.text <> '') then //----verifica se a OS é do tipo preventiva
    Begin
      QOSManutencaoCons.close;
      QOSManutencaoCons.setVariable('Num_OS_Manutencao',QOSManutencaoNum_OS_Manutencao.value);
      QOSManutencaoCons.open;
      QOSManutencao.insert; //-----inicia a gravação de uma nova OS Preventiva
      QOSManutencaoCod_Equipamento_Cab.Value := QOSManutencaoConsCod_Equipamento_Cab.Value;
      QOSManutencaoCod_Equipamento_Item.Value := QOSManutencaoConsCod_Equipamento_Item.Value;
      QOSManutencaoCod_Prioridade.value := QOSManutencaoConsCod_Prioridade.value;
      QOSManutencaoCod_Tipo_Servico.value:=QOSManutencaoConsCod_Tipo_Servico.value;
      QOSManutencaoDT_Emissao.value:= date;
      QOSManutencaoNum_Dias.value:=QOSManutencaoConsNum_Dias.value;
      QOSManutencaoDT_Prevista.value:=(QOSManutencaoConsDT_Encerramento.value + QOSManutencaoConsNum_dias.value);
      QOSManutencao.post;

      QOSManutencaoItemCons.close;//------Inicia a gravacao da OS Item
      QOSManutencaoItemCons.setVariable('Num_OS_Manutencao',QOSManutencaoConsNum_OS_Manutencao.value);
      QOSManutencaoItemCons.Open;
      QOSManutencaoItemCons.First;
      While not (QOSManutencaoItemCons.Eof) do //--------loop responsavel pela duplicação dos procedimentos
      Begin
        QOSManutencaoItem.Insert;
        QOSManutencaoItemNum_OS_Manutencao.value:=QOSManutencaoNum_OS_Manutencao.value;
        QOSManutencaoItemCod_Procedimento_Cab.value:=QOSManutencaoItemConsCod_Procedimento_Cab.value;
        QOSManutencaoItem.post;
        QOSManutencaoItemCons.next;
      end;
        showmessage('O.S. preventiva foi criada');
    end;
  end;
end;

procedure TFOSManutencaoEncerramento.BitBtn3Click(Sender: TObject);
begin
  close;
end;

end.
