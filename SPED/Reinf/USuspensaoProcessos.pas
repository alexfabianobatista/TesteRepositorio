unit USuspensaoProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, Grids, DBGrids, UReinf_cl, DBCtrls, UBiblioteca;

type
  TFSuspensaoProcessos = class(TFTCadSimples)
    dbgSuspensaoProcessos: TDBGrid;
    cbTipoSuspensao: TComboBox;
    dtpkDataDecisao: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbcbTemDeposito: TDBCheckBox;
    Label4: TLabel;
    dbeCodSuspensaoCont: TDBEdit;
    procedure LimpaCampos;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure cbTipoSuspensaoChange(Sender: TObject);
    procedure dbgSuspensaoProcessosCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuspensaoProcessos: TFSuspensaoProcessos;

implementation

uses
  UUsuario_cl;

{$R *.dfm}

procedure TFSuspensaoProcessos.cbTipoSuspensaoChange(Sender: TObject);
begin
  inherited;
  if (StrToInt(Copy(cbTipoSuspensao.Text, 1, 2)) = 90) then
  begin
    dbcbTemDeposito.Checked := false;
    dbcbTemDeposito.Enabled := false;
  end
  else if (StrToInt(Copy(cbTipoSuspensao.Text, 1, 2)) in [2,3]) then
  begin
    dbcbTemDeposito.Checked := true;
    dbcbTemDeposito.Enabled := false;
  end
  else
    dbcbTemDeposito.Enabled := true;
end;

procedure TFSuspensaoProcessos.LimpaCampos;
begin

    dbeCodSuspensaoCont.Clear;
    cbTipoSuspensao.Clear;
    dtpkDataDecisao.DateTime := Now;
    dbcbTemDeposito.Checked := false;
    
end;

procedure TFSuspensaoProcessos.AtivarDesativarCampos(Botao: TButton);
begin
//desativa a edição dos campos do formulário caso este não esteja em edição ou inserção
  dbeCodSuspensaoCont.Enabled := (DSPrimario.State in [dsEdit, dsInsert]);
  cbTipoSuspensao.Enabled := (DSPrimario.State in [dsEdit, dsInsert]);
  dtpkDataDecisao.Enabled := (DSPrimario.State in [dsEdit, dsInsert]);
  dbcbTemDeposito.Enabled := (DSPrimario.State in [dsEdit, dsInsert]); 

end;

procedure TFSuspensaoProcessos.dbgSuspensaoProcessosCellClick(
  Column: TColumn);
var
  i, index: integer;
  cod_susp, cod_cb: string;
begin
  inherited;
  index := 0;
  with DMReinf do
  begin
    QReinfSuspProcesso.Close;
    QReinfSuspProcesso.SetVariable('PK', dbgSuspensaoProcessos.DataSource.DataSet.FieldByName('COD_SUSPENSAO_R1070').Value);
    QReinfSuspProcesso.Open;

    cod_susp := Bib.StrZero(QReinfSuspProcessoIND_SUSPENSAO.Text, 2);
    for i := 0 to cbTipoSuspensao.Items.Count - 1 do
    begin
      cod_cb := Trim(Copy(cbTipoSuspensao.Items[i], 0,2));
      if Length(cod_cb) = 1 then
        cod_cb := Bib.StrZero(cod_cb, 2);
      if ( cod_susp = cod_cb) then
        index := i;
    end;

    cbTipoSuspensao.ItemIndex := index;

    dtpkDataDecisao.DateTime := QReinfSuspProcessoDT_DECISAO.Value;

  end;
end;

procedure TFSuspensaoProcessos.FormCreate(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin

    QReinfSuspProcesso.Open;
    QReinfSuspProcessoCons.Open;

  end;
  AtivarDesativarCampos(TButton(SBConfirmar));
end;

procedure TFSuspensaoProcessos.SBIncluirClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
  dbgSuspensaoProcessos.DataSource.DataSet.Refresh;  
end;

procedure TFSuspensaoProcessos.SBAlterarClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    dtpkDataDecisao.DateTime := QReinfSuspProcessoDT_DECISAO.Value;
  end;

  AtivarDesativarCampos(TButton(Sender));
  dbgSuspensaoProcessos.DataSource.DataSet.Refresh;  
end;

procedure TFSuspensaoProcessos.SBConfirmarClick(Sender: TObject);
begin
  with DMReinf do
  begin
    QReinfSuspProcessoDT_DECISAO.Value := dtpkDataDecisao.DateTime;
    QReinfSuspProcessoCOD_USUARIO.Value := DMUsuario.QUsuarioCOD_USUARIO.Value;
    QReinfSuspProcessoIND_SUSPENSAO.Value := StrToInt(Copy(cbTipoSuspensao.Text, 1, 2));
  end;
  inherited;
  AtivarDesativarCampos(TButton(Self));
  dbgSuspensaoProcessos.DataSource.DataSet.Refresh;
end;

procedure TFSuspensaoProcessos.SBExcluirClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  AtivarDesativarCampos(TButton(Self));
  dbgSuspensaoProcessos.DataSource.DataSet.Refresh;
end;

procedure TFSuspensaoProcessos.SBCancelarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Self));
  dbgSuspensaoProcessos.DataSource.DataSet.Refresh;
end;

end.
