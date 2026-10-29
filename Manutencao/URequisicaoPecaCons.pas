unit URequisicaoPecaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFRequisicaoPecaCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MERequisicao: TMaskEdit;
    MEFilial: TMaskEdit;
    MEFuncionario: TMaskEdit;
    MEOS: TMaskEdit;
    BTOS: TBitBtn;
    BTFilial: TBitBtn;
    BTFuncionario: TBitBtn;
    MEDt_Emissao_I: TMaskEdit;
    MEDt_Emissao_F: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    procedure BTOSClick(Sender: TObject);
    procedure BTFilialClick(Sender: TObject);
    procedure BTFuncionarioClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoPecaCons: TFRequisicaoPecaCons;

implementation

uses URequisicaoPeca_cl, UOSManutencaoCons, UOSManutencao_cl, UFilialCons,
  UFilial_cl, UFFuncionarioCons, UFuncionario_cl;

{$R *.DFM}

procedure TFRequisicaoPecaCons.BTOSClick(Sender: TObject);
begin
  inherited;
  If FOSManutencaoCons = Nil then
    FOSManutencaoCons := TFOSManutencaoCons.Create(Application);
  If FOSManutencaoCons.showModal = mrOk then
  begin
    FRequisicaoPecaCons.MERequisicao.Text := DMOSManutencao.QOSManutencaoConsNum_OS_Manutencao.Text;
  end;
end;

procedure TFRequisicaoPecaCons.BTFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.showModal = mrOk then
  begin
    FRequisicaoPecaCons.MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
  end;
end;

procedure TFRequisicaoPecaCons.BTFuncionarioClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
  begin
    FRequisicaoPecaCons.MEFuncionario.Text := DMFuncionario.QFuncionarioConsCod_Funcionario.Text;
  end;
end;

procedure TFRequisicaoPecaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRequisicaoPeca do
  Begin
    QRequisicaoPecaCons.Close;
    If Trim(MEOS.Text) = '' then
      QRequisicaoPecaCons.SetVariable('NUM_OS_MANUTENCAO',Null)
    Else
      QRequisicaoPecaCons.SetVariable('NUM_OS_MANUTENCAO',trim(MEOS.Text));
    If Trim(MERequisicao.Text) = '' then
      QRequisicaoPecaCons.SetVariable('NUM_REQUISICAO_PECA',Null)
    Else
      QRequisicaoPecaCons.SetVariable('NUM_REQUISICAO_PECA',Trim(MERequisicao.Text));
    If Trim(MEFuncionario.Text) = '' then
      QRequisicaoPecaCons.SetVariable('COD_FUNCIONARIO',Null)
    Else
      QRequisicaoPecaCons.SetVariable('COD_FUNCIONARIO',Trim(MEFuncionario.Text));
    If Trim(MEFilial.Text) = '' then
      QRequisicaoPecaCons.SetVariable('COD_FILIAL',Null)
    Else
      QRequisicaoPecaCons.SetVariable('COD_FILIAL',Trim(MEFilial.Text));
    If Trim(MEDt_Emissao_I.Text) = '' then
      QRequisicaoPecaCons.SetVariable('DATA_I',Null)
    Else
      QRequisicaoPecaCons.SetVariable('DATA_I',Trim(MEDt_Emissao_I.Text));
    If Trim(MEDt_Emissao_F.Text) = '' then
      QRequisicaoPecaCons.SetVariable('DATA_F',Null)
    Else
      QRequisicaoPecaCons.SetVariable('DATA_F',Trim(MEDt_Emissao_F.Text));
    QRequisicaoPecaCons.Open;
  End;
end;

end.
