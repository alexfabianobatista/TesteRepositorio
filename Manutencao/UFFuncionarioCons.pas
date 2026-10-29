unit UFFuncionarioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFFuncionarioCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    MEFuncaoFuncionario: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    BTFilialCons: TBitBtn;
    BTFuncaoCons: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure BTFuncaoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncionarioCons: TFFuncionarioCons;

implementation

uses UFuncionario_cl, UFilialCons, UFuncaoFuncionarioCons, UFilial_cl,
  UFuncaoFuncionario_cl;

{$R *.DFM}

procedure TFFuncionarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMFuncionario do
  Begin
    QFuncionarioCons.Close;
    if Trim(METexto.Text) = '' then
      QFuncionarioCons.SetVariable('DESCRICAO',Null)
    else
      QFuncionarioCons.SetVariable('DESCRICAO',METexto.Text);
    if Trim(MEFilial.Text) = '' then
      QFuncionarioCons.SetVariable('COD_FILIAL',Null)
    else
      QFuncionarioCons.SetVariable('COD_FILIAL',Trim(MEFilial.Text));
    if Trim(MEFuncaoFuncionario.Text) = '' then
      QFuncionarioCons.SetVariable('COD_FUNCAO_FUNCIONARIO',Null)
    else
      QFuncionarioCons.SetVariable('COD_FUNCAO_FUNCIONARIO',Trim(MEFuncaoFuncionario.Text));
    QFuncionarioCons.Open;
    
  End;
end;

procedure TFFuncionarioCons.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    FFuncionarioCons.MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFFuncionarioCons.BTFuncaoConsClick(Sender: TObject);
begin
  inherited;
  if FFuncaoFuncionarioCons = Nil then
    FFuncaoFuncionarioCons := TFFuncaoFuncionarioCons.Create(Application);
  if FFuncaoFuncionarioCons.showModal = mrOk then
    FFuncionarioCons.MEFuncaoFuncionario.Text := DMFuncaoFuncionario.QFuncaoFuncionarioConsCod_Funcao_Funcionario.Text;
end;

end.
