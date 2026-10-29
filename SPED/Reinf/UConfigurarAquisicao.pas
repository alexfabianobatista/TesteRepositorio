unit UConfigurarAquisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, Buttons, UFmFilial, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList, ImgList, DB, Menus, ComCtrls, Mask, ExtCtrls, UOperacao_cl;

type
  TFTConfigurarAquisicao = class(TFTCadSimples)
    DBGrid1: TDBGrid;
    cbTipoAquisicao: TComboBox;
    Label1: TLabel;
    MeOperacao: TMaskEdit;
    BtOperacao: TBitBtn;
    EdOperacao: TEdit;
    Label2: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    EdFilial: TEdit;
    Label3: TLabel;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure cbTipoAquisicaoChange(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure MeOperacaoChange(Sender: TObject);
    procedure LimparCampos;
    procedure InsereValores;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure MeFilialExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTConfigurarAquisicao: TFTConfigurarAquisicao;

implementation

uses UReinf_cl, UOperacaoCons, UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFTConfigurarAquisicao.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin

  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  MeFilial.Enabled := isAtivo;
  EdFilial.Enabled := isAtivo;
  BtFilial.Enabled := isAtivo;
  cbTipoAquisicao.Enabled := isAtivo;
  MeOperacao.Enabled := isAtivo;
  EdOperacao.Enabled := isAtivo;
  BtOperacao.Enabled := isAtivo;

end;

procedure TFTConfigurarAquisicao.cbTipoAquisicaoChange(Sender: TObject);
begin
  inherited;
 with DMReinf do
  begin
    if (DSPrimario.State in [dsInsert, dsEdit]) then
    begin
      if cbTipoAquisicao.ItemIndex > 0 then
        QConfigAquisicaoOperacaoIND_AQUISICAO.Value := cbTipoAquisicao.ItemIndex
      else
        Raise Exception.Create('Tipo de aquisição é obrigatório.');
    end;
  end;

end;

procedure TFTConfigurarAquisicao.FormCreate(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QConfigAquisicaoOperacao.Open;
    AtivarDesativarCampos(TButton(SBRefresh));
    
  end;
end;

procedure TFTConfigurarAquisicao.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  with DMReinf, DMOperacao do
  begin
    if FOperacaoCons = nil then
      FOperacaoCons := TFOperacaoCons.Create(Application);

    if FOperacaoCons.ShowModal = mrOk then
    begin
      MeOperacao.Text := QOperacaoConsCOD_OPERACAO.Text;
      EdOperacao.Text := QOperacaoConsDESC_OPERACAO.Text;
    end;
  end;
  FreeAndNil(FOperacaoCons);
end;

procedure TFTConfigurarAquisicao.SBIncluirClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));

end;

procedure TFTConfigurarAquisicao.SBAlterarClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    MeFilial.Text := QConfigAquisicaoOperacaoCOD_FILIAL.Text;
    MeOperacao.Text := QConfigAquisicaoOperacaoCOD_OPERACAO.Text;
    cbTipoAquisicao.ItemIndex := QConfigAquisicaoOperacaoIND_AQUISICAO.Value;
  end;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFTConfigurarAquisicao.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  InsereValores;
  AtivarDesativarCampos(TButton(Sender));
  LimparCampos;
end;

procedure TFTConfigurarAquisicao.SBExcluirClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
  LimparCampos;
end;

procedure TFTConfigurarAquisicao.SBCancelarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
  LimparCampos;
end;

procedure TFTConfigurarAquisicao.MeOperacaoChange(Sender: TObject);
begin
  with DMReinf do
  begin
    if QConfigAquisicaoOperacao.State in [dsInsert, dsEdit] then
    begin
      if MeOperacao.Text <> '' then
        QConfigAquisicaoOperacaoCOD_OPERACAO.Text := Trim(MeOperacao.Text);
    end;
  end;

end;

procedure TFTConfigurarAquisicao.LimparCampos;
begin
  MeFilial.Clear;
  EdFilial.Clear;
  MeOperacao.Clear;
  EdOperacao.Clear;
  cbTipoAquisicao.ItemIndex := 0;
end;

procedure TFTConfigurarAquisicao.BtFilialClick(Sender: TObject);
begin
  with DMFilial do
  begin
    if FFilialCons = nil then
      FFilialCons := TFFilialCons.Create(Application);

    if FFilialCons.ShowModal = mrOK then
    begin
      MeFilial.Text := QFilialConsCOD_FILIAL.Text;
      EdFilial.Text := QFilialConsDESC_FILIAL.Text;
    end;
    FreeAndNil(FFilialCons);
  end;
end;

procedure TFTConfigurarAquisicao.InsereValores;
begin
  with DMReinf do
  begin
    if Trim(MeFilial.Text) <> '' then
      QConfigAquisicaoOperacaoCOD_FILIAL.Text := Trim(MeFilial.Text)
    else
      Raise Exception.Create('A filial é obrigatória.');

    if cbTipoAquisicao.ItemIndex > 0 then
      QConfigAquisicaoOperacaoIND_AQUISICAO.Value := cbTipoAquisicao.ItemIndex
    else
      Raise Exception.Create('Tipo de Aquisição é obrigatório.');

    if Trim(MeOperacao.Text) <> '' then
      QConfigAquisicaoOperacaoCOD_OPERACAO.Text := Trim(MeOperacao.Text)
    else
      Raise Exception.Create('A operação é obrigatória.'); 

  end;
end;

procedure TFTConfigurarAquisicao.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    MeFilial.Text := QConfigAquisicaoOperacaoCOD_FILIAL.Text;
    MeOperacao.Text := QConfigAquisicaoOperacaoCOD_OPERACAO.Text;
    cbTipoAquisicao.ItemIndex := QConfigAquisicaoOperacaoIND_AQUISICAO.Value;
  end;
  if DMReinf.QConfigAquisicaoOperacao.State in [dsInsert, dsEdit] then
    AtivarDesativarCampos(TButton(SBIncluir))
  else
    AtivarDesativarCampos(TButton(SBCancelar));

end;

procedure TFTConfigurarAquisicao.MeFilialExit(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QConfigAquisicaoOperacao.State in [dsInsert, dsEdit] then
    begin
      if MeFilial.Text <> '' then
        QConfigAquisicaoOperacaoCOD_FILIAL.Text := Trim(MeFilial.Text);
    end;
  end;
end;

end.
