unit UContaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ImgList, Menus, Db, DBCtrls;

type
  TFContaCad = class(TForm)
    DSPrimario: TDataSource;
    MMCadastro: TMainMenu;
    MRegistro: TMenuItem;
    MRIncluir: TMenuItem;
    MRAlterar: TMenuItem;
    MRConfirmar: TMenuItem;
    MRExcluir: TMenuItem;
    MRCancelar: TMenuItem;
    MRAtualizar: TMenuItem;
    MRConsultar: TMenuItem;
    N1: TMenuItem;
    MRSair: TMenuItem;
    MRelatorios: TMenuItem;
    MOperacao: TMenuItem;
    MAjuda: TMenuItem;
    Sobre1: TMenuItem;
    ImageList1: TImageList;
    Panel1: TPanel;
    SBIncluir: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBConfirmar: TSpeedButton;
    SBApagar: TSpeedButton;
    SBCancelar: TSpeedButton;
    SBAtualizar: TSpeedButton;
    SBConsultar: TSpeedButton;
    MeLocaliza: TMaskEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Contedo1: TMenuItem;
    Procedure Incluir();
    Procedure Alterar();
    Procedure Confirmar();
    Procedure Excluir();
    Procedure Cancelar();
    Procedure Atualizar();
    Procedure Consultar();
    Procedure Sair();
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MRIncluirClick(Sender: TObject);
    procedure MRAlterarClick(Sender: TObject);
    procedure MRConfirmarClick(Sender: TObject);
    procedure MRExcluirClick(Sender: TObject);
    procedure MRCancelarClick(Sender: TObject);
    procedure MRAtualizarClick(Sender: TObject);
    procedure MRConsultarClick(Sender: TObject);
    procedure MRSairClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBApagarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBAtualizarClick(Sender: TObject);
    procedure SBConsultarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure MeLocalizaExit(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Contedo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FChamador : TForm;
    { Public declarations }
  end;

var
  FContaCad: TFContaCad;

implementation

uses UConta_cl, UContaCons, URotinas, USobre;

Procedure TFContaCad.Incluir();
Begin
  DMConta.QConta.Insert;
  DMConta.QContaVAL_SERIE_ARQUIVO.Value := 1;
End;

Procedure TFContaCad.Alterar();
Begin
  DMConta.QConta.Edit;
End;

Procedure TFContaCad.Confirmar();
Var
  Rot : TRotinas;
Begin
  Rot := TRotinas.Create;
  If( Trim(DMConta.QContaNUM_CGC_CPF.Text)='' )Then
    raise Exception.Create('Número de CPF/CGC não Informado');

  If(DMConta.QContaIND_FISICA_JURIDICA.Text = 'F')Then
    If(NOT Rot.ValidaCPF(DMConta.QContaNUM_CGC_CPF.Text))Then
      raise Exception.Create('O Número de CPF é Inválido')
  Else
    If(NOT Rot.ValidaCGC(DMConta.QContaNUM_CGC_CPF.Text))Then
      raise Exception.Create('O Número de CGC é Inválido');
  DMConta.QConta.Post
End;

Procedure TFContaCad.Excluir();
Begin
  if MessageDlg('Deseja Realmente APAGAR o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    DMConta.QConta.Delete;
  End;
End;

Procedure TFContaCad.Cancelar();
Begin
  DMConta.QConta.Cancel;
End;

Procedure TFContaCad.Atualizar();
Var
  wintCodigo : Integer;
begin
  With DMConta Do
  Begin
    If(NOT QContaCOD_CONTA.IsNull)Then
    Begin
      wintCodigo := QContaCOD_CONTA.Value;
      QConta.Close;
      QConta.ParamByName('PK').AsInteger := wintCodigo;
      QConta.Open;
    End;
  End;
end;

Procedure TFContaCad.Consultar();
Begin
  If(FContaCons = Nil)Then
    FContaCons := TFContaCons.Create(Application);
  If(FContaCons.ShowModal = mrOk)Then
  Begin
    DMConta.QConta.Close;
    DMConta.QConta.ParamByName('PK').AsInteger := DMConta.QContaConsCOD_CONTA.Value;
    DMConta.QConta.Open;
  End;
End;

Procedure TFContaCad.Sair();
Begin
  Close;
End;


{$R *.DFM}

procedure TFContaCad.FormActivate(Sender: TObject);
begin
  FChamador.Hide;
  DMConta.QConta.Open;
end;

procedure TFContaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If(DSPrimario.State in [DsInsert,DsEdit])Then
    raise Exception.Create('Dados não Confirmados: Confirme ou Cancele Operação');
  DMConta.QConta.Close;
  DMConta.QContaCons.Close;
  FChamador.Visible := True;  
  Action := CaFree;
  FContaCad := nil;
end;

procedure TFContaCad.MRIncluirClick(Sender: TObject);
begin
  Incluir();
end;

procedure TFContaCad.MRAlterarClick(Sender: TObject);
begin
  Alterar();
end;

procedure TFContaCad.MRConfirmarClick(Sender: TObject);
begin
  Confirmar();
end;

procedure TFContaCad.MRExcluirClick(Sender: TObject);
begin
  Excluir();
end;

procedure TFContaCad.MRCancelarClick(Sender: TObject);
begin
  Cancelar();
end;

procedure TFContaCad.MRAtualizarClick(Sender: TObject);
begin
  Atualizar();
end;

procedure TFContaCad.MRConsultarClick(Sender: TObject);
begin
  Consultar();
end;

procedure TFContaCad.MRSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFContaCad.SBIncluirClick(Sender: TObject);
begin
  Incluir();
end;

procedure TFContaCad.SBAlterarClick(Sender: TObject);
begin
  Alterar();
end;

procedure TFContaCad.SBConfirmarClick(Sender: TObject);
begin
  Confirmar();
end;

procedure TFContaCad.SBApagarClick(Sender: TObject);
begin
  Excluir();
end;

procedure TFContaCad.SBCancelarClick(Sender: TObject);
begin
  Cancelar();
end;

procedure TFContaCad.SBAtualizarClick(Sender: TObject);
begin
  Atualizar();
end;

procedure TFContaCad.SBConsultarClick(Sender: TObject);
begin
  Consultar();
end;

procedure TFContaCad.DSPrimarioStateChange(Sender: TObject);
begin
  If DSPrimario.DataSet.State in [dsEdit,dsInsert] then
  Begin
    SBIncluir.Enabled := False;
    SBAlterar.Enabled := False;
    SBApagar.Enabled := False;
    SBConfirmar.Enabled := True;
    SBCancelar.Enabled := True;
    SBAtualizar.Enabled := False;
    MELocaliza.Enabled := False;
    SBConsultar.Enabled := False;
  End
  Else
  If DSPrimario.DataSet.State = dsBrowse then
  Begin
    SBIncluir.Enabled := True;
    SBAlterar.Enabled := True;
    SBApagar.Enabled := True;
    SBConfirmar.Enabled := False;
    SBCancelar.Enabled := False;
    SBAtualizar.Enabled := True;
    MELocaliza.Enabled := True;
    SBConsultar.Enabled := True;
  End;
  MMCadastro.Items[0].Items[0].Enabled := SBIncluir.Enabled;
  MMCadastro.Items[0].Items[1].Enabled := SBAlterar.Enabled;
  MMCadastro.Items[0].Items[2].Enabled := SBConfirmar.Enabled;
  MMCadastro.Items[0].Items[3].Enabled := SBApagar.Enabled;
  MMCadastro.Items[0].Items[4].Enabled := SBCancelar.Enabled;
  MMCadastro.Items[0].Items[5].Enabled := SBAtualizar.Enabled;
  MMCadastro.Items[0].Items[6].Enabled := SBConsultar.Enabled;
  MMCadastro.Items[0].Items[8].Enabled := SBAtualizar.Enabled; // Sair
//  MMCadastro.Items[1].Enabled := SBAtualizar.Enabled; // Relatorio
end;

procedure TFContaCad.MeLocalizaExit(Sender: TObject);
begin
  If(Trim(MeLocaliza.Text)<>'')Then
  Begin
    With DMConta Do
    Begin
      QConta.Close;
      QConta.ParamByName('PK').AsInteger := StrToInt( Trim(MeLocaliza.Text) );
      QConta.Open;
    End;
    MeLocaliza.Clear;
  End;
end;

procedure TFContaCad.Sobre1Click(Sender: TObject);
begin
  If(FSobre = nil)Then
    FSobre := TFSobre.Create(Application);
  FSobre.showmodal;
end;

procedure TFContaCad.Contedo1Click(Sender: TObject);
begin
  Application.HelpContext(2);
end;

end.
