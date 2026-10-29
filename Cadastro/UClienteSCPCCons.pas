unit UClienteSCPCCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFClienteSCPCCons = class(TFTConsulta)
    Label2: TLabel;
    MeCPF: TMaskEdit;
    GroupBox1: TGroupBox;
    MeData_I: TMaskEdit;
    MeData_F: TMaskEdit;
    Label3: TLabel;
    SBCliente: TSpeedButton;
    MeAutorizado: TMaskEdit;
    Autorizado: TLabel;
    MeCPFAutorizado: TMaskEdit;
    Label4: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteSCPCCons: TFClienteSCPCCons;

implementation

uses UCadastro_cl, UCadastroCons;

{$R *.dfm}

procedure TFClienteSCPCCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    QClienteSCPCCons.Close;

    if Trim(MeTexto.Text) <> '' then
      QClienteSCPCCons.SetVariable('NOME', Trim(MeTexto.Text))
    else
      QClienteSCPCCons.SetVariable('NOME', null);

    if Trim(MeCPF.Text) <> '' then
      QClienteSCPCCons.SetVariable('CPF', Trim(MeCPF.Text))
    else
      QClienteSCPCCons.SetVariable('CPF', null);

    if Trim(MeData_I.Text) <> '' then
      QClienteSCPCCons.SetVariable('DATA_I', Trim(MeData_I.Text))
    else
      Raise Exception.Create('Data inicial deve ser informada');

    if Trim(MEAutorizado.Text) <> '' then
      QClienteSCPCCons.SetVariable('AUTORIZADO', Trim(MEAutorizado.Text))
    else
      QClienteSCPCCons.SetVariable('AUTORIZADO', null);

    if Trim(MECPFAutorizado.Text) <> '' then
      QClienteSCPCCons.SetVariable('CPFAUTORIZADO', Trim(MECPFAutorizado.Text))
    else
      QClienteSCPCCons.SetVariable('CPFAUTORIZADO', null);


    if Trim(MeData_F.Text) <> '' then
      QClienteSCPCCons.SetVariable('DATA_F', Trim(MeData_F.Text))
    else
      QClienteSCPCCons.SetVariable('DATA_F', DateToStr(Date));

    QClienteSCPCCons.Open;
  end;
end;

procedure TFClienteSCPCCons.SBClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    MeTexto.Text := DMCadastro.QCadastroConsNOME.Text;
end;

end.
